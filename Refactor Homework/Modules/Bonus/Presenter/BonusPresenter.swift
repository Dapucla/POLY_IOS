//
//  BonusPresenter.swift
//  Refactor Homework
//
//  Created by Даниил Алексеев on 25.01.2022.
//

import Foundation

protocol BonusProtocol {
    func viewDidLoadEvent()
}

final class BonusPresenter: BonusProtocol {
    
    let networkService: NetworkServiceMock
    weak var bonusView: BonusView?
    
    init(networkService: NetworkServiceMock) {
        self.networkService = networkService
    }
    
    func getBalance() {
        networkService.getBonusBalance { (result) in
            DispatchQueue.main.async {
                self.bonusView?.endActivity()
                switch result {
                case .success(let model):
                    self.bonusView?.refreshBalance("\(model.bonusAmount)")
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func getText() {
        networkService.getBonusText { (result) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    self.bonusView?.recieveBonus(model.bonusText)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func viewDidLoadEvent() {
        bonusView?.setupView()
        bonusView?.layoutView()
        self.getText()
        self.getBalance()
    }
}
