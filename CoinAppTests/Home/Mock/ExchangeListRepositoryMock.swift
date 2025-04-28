//
//  FakeExchangeListRepository.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 28/04/25.
//

@testable import CoinApp

final class ExchangeListRepositoryMock: ExchangeListInputProtocol {
    var output: ExchangeListOutputProtocol?
    private(set) var fetchCalled = false

    func fetchExchanges() {
        fetchCalled = true
    }

    func completeSuccess(_ list: [ExchangeModel]?) {
        output?.fetchExchangesSuccess(exchanges: list)
    }

    func completeFailure(_ error: Error) {
        output?.fetchExchangesFailure(error: error)
    }
}
