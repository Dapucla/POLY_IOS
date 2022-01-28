//
//  AgreementsPresenter.swift
//  Refactor Homework
//
//  Created by Даниил Алексеев on 25.01.2022.
//

import Foundation

protocol AgreementProtocol {
    func viewDidLoadEvent()
    func showAgreement()
    init(networkService: NetworkServiceMock)
}
class AgreementPresenter: AgreementProtocol {
    
    let networkService: NetworkServiceMock
    weak var agreementView: AgreementView?
    
    required init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    func viewDidLoadEvent() {
        agreementView?.setupView()
        agreementView?.layoutView()
    }
    
    func showAgreement() {
        networkService.getAgreement { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.agreementView?.endAct()
                switch result {
                case .success(let model):
                    self.agreementView?.updateAgreement(model.text) 
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
