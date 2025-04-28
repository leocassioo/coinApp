//
//  ExchangeViewModel.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import Foundation

internal class ExchangeViewModel: ExchangeListViewModelProtocol {
    @Published internal var exchanges: [ExchangeModel] = []
    @Published internal var errorMessage: String?
    
    private let repository: ExchangeListInputProtocol
    
    internal init(repository: ExchangeListInputProtocol = ExchangeListRepository()) {
        self.repository = repository
        self.repository.output = self
    }
    
    internal func loadExchanges() {
        repository.fetchExchanges()
    }
}

extension ExchangeViewModel: ExchangeListOutputProtocol {
    
    internal func fetchExchangesSuccess(exchanges: [ExchangeModel]?) {
        DispatchQueue.main.async {
            if let exchanges {
                self.exchanges = exchanges
            } else {
                self.errorMessage = "No exchanges found."
            }
        }
    }
    
    internal func fetchExchangesFailure(error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
        }
    }
    
}
