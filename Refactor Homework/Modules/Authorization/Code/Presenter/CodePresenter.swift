//
//  CodePresenter.swift
//  Refactor Homework
//
//  Created by Даниил Алексеев on 25.01.2022.
//

import Foundation

protocol CodeProtocol {
    init(networkService: NetworkServiceMock, model: Code)
    func checkCode()
    func viewDidLoadEvent()
    func viewWillAppearEvent()
    func viewWillDisappearEvent()
}

final class CodePresenter: CodeProtocol {
    
    let networkService: NetworkServiceMock
    let model: Code
    weak var codeView: CodeView?
    
    init(networkService: NetworkServiceMock, model: Code) {
        self.networkService = networkService
        self.model = model
    }
    
    func viewDidLoadEvent() {
        codeView?.setupView()
        codeView?.layoutView()
    }
    
    func viewWillAppearEvent() {
        codeView?.willAppear()
    }
    
    func viewWillDisappearEvent() {
        codeView?.willDisappear()
    }
    
    @objc func checkCode() {
        codeView?.updateCode()
        
        codeView?.startActivity()
        
        networkService.authSent(smsCode: model.normalCodeString) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.codeView?.endActivity()
                switch result {
                case .success(_):
                    self.codeView?.clickSms()
                case .failure(_):
                    self.codeView?.viewLabel()
                }
            }
        }
    }
}
