//
//  ExchangeListRepository.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import Foundation

internal class ExchangeListRepository: ExchangeListInputProtocol {
    internal var output: ExchangeListOutputProtocol?
    private let networkService: NetworkServiceProtocol
    
    internal init(networkService: NetworkServiceProtocol = NetworkService.shared) {
        self.networkService = networkService
    }
    
    internal func fetchExchanges() {
        let constructor = ExchangeListConstructor.getExchanges
        
        networkService.request(constructor: constructor) { (result: Result<[ExchangeModel]?, Error>) in
            switch result {
            case .success(let exchanges):
                self.output?.fetchExchangesSuccess(exchanges: exchanges)
            case .failure(let error):
                self.output?.fetchExchangesFailure(error: error)
            }
        }
    }
}
