//
//  ExchangeDetailViewModelTests.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 27/04/25.
//

import XCTest
@testable import CoinApp

final class ExchangeDetailViewModelTests: XCTestCase {
    var fakeRepository: DetailRepositoryMock!
    var sut: ExchangeDetailViewModel!

    override func setUp() {
        super.setUp()
        fakeRepository = DetailRepositoryMock()
        sut = ExchangeDetailViewModel(exchangeId: "ABC123", repository: fakeRepository)
    }

    override func tearDown() {
        sut = nil
        fakeRepository = nil
        super.tearDown()
    }

    func test_loadDetail_callsRepository() {
        sut.loadDetail()
        XCTAssertEqual(fakeRepository.fetchCalledWith, "ABC123")
    }

    func test_fetchExchangeSuccess_updatesExchange() {
        let model = ExchangeModel.makeDummy(id: "ABC123")

        sut.loadDetail()
        fakeRepository.completeSuccess([model])

        let expectation = expectation(description: "Wait for main queue")
        DispatchQueue.main.async {
            XCTAssertEqual(self.sut.exchange?.id, "ABC123")
            XCTAssertNil(self.sut.errorMessage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }

    func test_fetchExchangeSuccessEmpty_setsErrorMessage() {
        sut.loadDetail()
        fakeRepository.completeSuccess([])

        let expectation = expectation(description: "Async update")
        DispatchQueue.main.async {
            XCTAssertEqual(self.sut.errorMessage, "Exchange details not found.")
            XCTAssertNil(self.sut.exchange)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }

    func test_fetchExchangeFailure_setsErrorMessage() {
        sut.loadDetail()
        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Network error"])
        fakeRepository.completeFailure(error)

        let expectation = expectation(description: "Async errorMessage update")
        DispatchQueue.main.async {
            XCTAssertEqual(self.sut.errorMessage, "Network error")
            XCTAssertNil(self.sut.exchange)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }
    
}
