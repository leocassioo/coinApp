//
//  ExchangeViewModelTests.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 28/04/25.
//

import XCTest
@testable import CoinApp

final class ExchangeViewModelTests: XCTestCase {
    var fakeRepository: ExchangeListRepositoryMock!
    var viewModel: ExchangeViewModel!

    override func setUp() {
        super.setUp()
        fakeRepository = ExchangeListRepositoryMock()
        viewModel = ExchangeViewModel(repository: fakeRepository)
    }

    override func tearDown() {
        viewModel = nil
        fakeRepository = nil
        super.tearDown()
    }

    func test_loadExchanges_callsRepository() {
        viewModel.loadExchanges()
        XCTAssertTrue(fakeRepository.fetchCalled)
    }

    func test_fetchExchangesSuccess_updatesExchanges() {
        let dummy = ExchangeModel.makeDummy(id: "X", website: nil, name: "N")
        viewModel.loadExchanges()
        fakeRepository.completeSuccess([dummy])

        let expectation = expectation(description: "async update")
        DispatchQueue.main.async {
            XCTAssertEqual(self.viewModel.exchanges.count, 1)
            XCTAssertEqual(self.viewModel.exchanges.first?.id, "X")
            XCTAssertNil(self.viewModel.errorMessage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }

    func test_fetchExchangesSuccessNil_setsErrorMessage() {
        viewModel.loadExchanges()
        fakeRepository.completeSuccess(nil)

        let expectation = expectation(description: "async error")
        DispatchQueue.main.async {
            XCTAssertEqual(self.viewModel.errorMessage, "No exchanges found.")
            XCTAssertTrue(self.viewModel.exchanges.isEmpty)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }

    func test_fetchExchangesFailure_setsErrorMessage() {
        viewModel.loadExchanges()
        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Network fail"])
        fakeRepository.completeFailure(error)

        let expectation = expectation(description: "async failure")
        DispatchQueue.main.async {
            XCTAssertEqual(self.viewModel.errorMessage, "Network fail")
            XCTAssertTrue(self.viewModel.exchanges.isEmpty)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)
    }
}
