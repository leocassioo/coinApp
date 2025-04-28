//
//  ExchangeDetailOutputDummy.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 27/04/25.
//

import XCTest
@testable import CoinApp

final class ExchangeDetailOutputDummy: ExchangeDetailOutputProtocol {
    var successCalled = false
    var receivedExchange: [ExchangeModel]? = nil

    var failureCalled = false
    var receivedError: Error? = nil

    func fetchExchangeSuccess(exchange: [ExchangeModel]?) {
        successCalled = true
        receivedExchange = exchange
    }

    func fetchExchangeFailure(error: Error) {
        failureCalled = true
        receivedError = error
    }
}
