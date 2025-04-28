//
//  ExchangeListRepositoryTests.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 28/04/25.
//

import XCTest
@testable import CoinApp

final class ExchangeListRepositoryTests: XCTestCase {

    var fakeNetwork: NetworkServiceMock!
    var repository: ExchangeListRepository!
    var dummyOutput: ExchangeListOutputDummy!

    override func setUp() {
        super.setUp()
        fakeNetwork = NetworkServiceMock()
        repository = ExchangeListRepository(networkService: fakeNetwork)
        dummyOutput = ExchangeListOutputDummy()
        repository.output = dummyOutput
    }

    override func tearDown() {
        dummyOutput = nil
        repository = nil
        fakeNetwork = nil
        super.tearDown()
    }

    func test_fetchExchanges_passesCorrectConstructor() {
        repository.fetchExchanges()
        XCTAssertTrue(fakeNetwork.lastConstructor is ExchangeListConstructor)
        if let constructor = fakeNetwork.lastConstructor as? ExchangeListConstructor {
            switch constructor {
            case .getExchanges:
                break
            }
        }
    }

    func test_fetchExchanges_onSuccess_callsOutputSuccess() {
        let model = ExchangeModel.makeDummy(id: "X")
        repository.fetchExchanges()
        fakeNetwork.completeSuccess([model])

        XCTAssertTrue(dummyOutput.successCalled)
        XCTAssertEqual(dummyOutput.receivedExchanges?.count, 1)
        XCTAssertEqual(dummyOutput.receivedExchanges?.first?.id, "X")
    }

    func test_fetchExchanges_onFailure_callsOutputFailure() {
        repository.fetchExchanges()
        let error = DummyError.any
        fakeNetwork.completeFailure(error)

        XCTAssertTrue(dummyOutput.failureCalled)
        XCTAssertEqual(dummyOutput.receivedError as? DummyError, .any)
    }
}
