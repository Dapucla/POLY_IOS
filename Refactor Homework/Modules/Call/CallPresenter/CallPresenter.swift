//
//  CallPresenter.swift
//  Refactor Homework
//
//  Created by Даниил Алексеев on 25.01.2022.
//

import Foundation

protocol CallPresenterInterface: AnyObject {
    func getCallNumber(complition: @escaping (Result<Call, Error>) -> Void)
    func viewDidLoadEvent()
    func viewWillAppearEvent()
}

final class CallPresenter: CallPresenterInterface {
        
    private let networkService: NetworkServiceMock
    
    weak var callView: CallView?
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    func getCallNumber(complition: @escaping (Result<Call, Error>) -> Void) {
        networkService.getCallNumber(complition: complition)
    }
    
    func viewDidLoadEvent() {
        callView?.setupView()
        callView?.layoutView()
    }
    
    func viewWillAppearEvent() {
        callView?.animation ()
    }
}
