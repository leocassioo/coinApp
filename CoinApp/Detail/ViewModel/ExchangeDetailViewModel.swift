//
//  ExchangeDetailViewModel.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import Foundation

internal class ExchangeDetailViewModel: ExchangeDetailViewModelProtocol {
    @Published internal var exchange: ExchangeModel?
    @Published internal var errorMessage: String?
    
    private let exchangeId: String
    private let repository: ExchangeDetailInputProtocol
    
    internal init(exchangeId: String,
                  repository: ExchangeDetailInputProtocol = ExchangeDetailRepository()) {
        self.exchangeId = exchangeId
        self.repository = repository
        self.repository.output = self
    }
    
    internal func loadDetail() {
        repository.fetchExchange(exchangeId: exchangeId)
    }
}

extension ExchangeDetailViewModel: ExchangeDetailOutputProtocol {
    
    internal func fetchExchangeSuccess(exchange: [ExchangeModel]?) {
        DispatchQueue.main.async {
            if let result = exchange, let currentExchange = result.first {
                self.exchange = currentExchange
            } else {
                self.errorMessage = "Exchange details not found."
            }
        }
    }
    
    internal func fetchExchangeFailure(error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
        }
    }
}
