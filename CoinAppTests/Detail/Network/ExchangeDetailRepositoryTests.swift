//
//  ExchangeDetailRepositoryTests.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 27/04/25.
//

import XCTest
@testable import CoinApp

final class ExchangeDetailRepositoryTests: XCTestCase {

    var fakeNetwork: NetworkServiceMock!
    var repository: ExchangeDetailRepository!
    var dummyOutput: ExchangeDetailOutputDummy!

    override func setUp() {
        super.setUp()
        fakeNetwork = NetworkServiceMock()
        repository = ExchangeDetailRepository(networkService: fakeNetwork)
        dummyOutput = ExchangeDetailOutputDummy()
        repository.output = dummyOutput
    }

    override func tearDown() {
        dummyOutput = nil
        repository = nil
        fakeNetwork = nil
        super.tearDown()
    }

    func test_fetchExchange_passesCorrectConstructor() {
        
        repository.fetchExchange(exchangeId: "XYZ")
        
        XCTAssertTrue(fakeNetwork.lastConstructor is ExchangeDetailConstructor)
        if let constructor = fakeNetwork.lastConstructor as? ExchangeDetailConstructor {
            switch constructor {
            case .getExchange(let id):
                XCTAssertEqual(id, "XYZ")
            }
        }
    }

    func test_fetchExchange_onSuccess_callsOutputSuccess() {
        let model = ExchangeModel.makeDummy(id: "A")
        
        repository.fetchExchange(exchangeId: "ANY")
        
        fakeNetwork.completeSuccess([model])
        
        XCTAssertTrue(dummyOutput.successCalled)
        XCTAssertEqual(dummyOutput.receivedExchange?.count, 1)
        XCTAssertEqual(dummyOutput.receivedExchange?.first?.id, "A")
    }

    func test_fetchExchange_onFailure_callsOutputFailure() {
        
        repository.fetchExchange(exchangeId: "ANY")
        
        fakeNetwork.completeFailure(DummyError.any)
        
        XCTAssertTrue(dummyOutput.failureCalled)
        XCTAssertEqual(dummyOutput.receivedError as? DummyError, .any)
    }
}
