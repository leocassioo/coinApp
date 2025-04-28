//
//  ExchangeDetailRepository.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import Foundation

internal class ExchangeDetailRepository: ExchangeDetailInputProtocol {
    
    internal var output: ExchangeDetailOutputProtocol?
    private let networkService: NetworkServiceProtocol
    
    internal init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }
    
    internal func fetchExchange(exchangeId: String) {
        let constructor = ExchangeDetailConstructor.getExchange(exchangeId: exchangeId)
        
        networkService.request(constructor: constructor) { (result: Result<[ExchangeModel]?, Error>) in
            switch result {
            case .success(let exchange):
                self.output?.fetchExchangeSuccess(exchange: exchange)
            case .failure(let error):
                self.output?.fetchExchangeFailure(error: error)
            }
        }
    }
}
