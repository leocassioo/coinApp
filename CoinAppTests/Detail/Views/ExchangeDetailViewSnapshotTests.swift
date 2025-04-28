//
//  ExchangeDetailViewSnapshotTests.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 28/04/25.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import CoinApp

final class ExchangeDetailViewSnapshotTests: XCTestCase {
    private var sut: ExchangeDetailView<ExchangeDetailViewModelSpy>!
    private var viewModel: ExchangeDetailViewModelSpy!

    override func setUp() {
        super.setUp()
        isRecording = false
        viewModel = ExchangeDetailViewModelSpy()
        sut = ExchangeDetailView(viewModel: viewModel)
    }

    override func tearDown() {
        sut = nil
        viewModel = nil
        super.tearDown()
    }

    func test_loading_state() {
        viewModel.exchange = nil
        viewModel.errorMessage = nil
        
        let view = UIHostingController(rootView: sut)
        assertSnapshot(matching: view, as: .image(on: .iPhone13Pro, precision: 0.95))
    }

    func test_error_state() {
        viewModel.errorMessage = "Network failure"
        viewModel.exchange = nil

        let view = UIHostingController(rootView: sut)
        assertSnapshot(matching: view, as: .image(on: .iPhone13Pro, precision: 0.95))
    }

    func test_success_state() {
        viewModel.exchange = ExchangeModel.makeDummy()
        viewModel.errorMessage = nil

        let view = UIHostingController(rootView: sut)
        assertSnapshot(matching: view, as: .image(on: .iPhone13Pro, precision: 0.95))
    }
}
