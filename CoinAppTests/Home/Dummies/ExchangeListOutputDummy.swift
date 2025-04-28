//
//  ExchangeListOutputDummy.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 28/04/25.
//

import XCTest
@testable import CoinApp

final class ExchangeListOutputDummy: ExchangeListOutputProtocol {
    var successCalled = false
    var receivedExchanges: [ExchangeModel]?
    var failureCalled = false
    var receivedError: Error?

    func fetchExchangesSuccess(exchanges: [ExchangeModel]?) {
        successCalled = true
        receivedExchanges = exchanges
    }

    func fetchExchangesFailure(error: Error) {
        failureCalled = true
        receivedError = error
    }
}
