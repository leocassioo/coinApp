//
//  FakeDetailRepository.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 27/04/25.
//

import XCTest
@testable import CoinApp

final class DetailRepositoryMock: ExchangeDetailInputProtocol {
    var output: ExchangeDetailOutputProtocol?
    private(set) var fetchCalledWith: String?

    func fetchExchange(exchangeId: String) {
        fetchCalledWith = exchangeId
    }
    
    func completeSuccess(_ models: [ExchangeModel]?) {
        output?.fetchExchangeSuccess(exchange: models)
    }
    
    func completeFailure(_ error: Error) {
        output?.fetchExchangeFailure(error: error)
    }
}
