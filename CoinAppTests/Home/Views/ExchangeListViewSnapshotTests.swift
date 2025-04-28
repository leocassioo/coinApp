//
//  ExchangeListViewSnapshotTests.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 28/04/25.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import CoinApp

final class ExchangeListViewSnapshotTests: XCTestCase {
    private var sut: ExchangeListView<ExchangeListViewModelSpy>!
    private var viewModel: ExchangeListViewModelSpy!

    override func setUp() {
        super.setUp()
        isRecording = false
        viewModel = ExchangeListViewModelSpy()
        sut = ExchangeListView(viewModel: viewModel)
    }

    override func tearDown() {
        sut = nil
        viewModel = nil
        super.tearDown()
    }

    func test_exchangesLoading_state() {
        viewModel.exchanges = []
        viewModel.errorMessage = nil

        let vc = UIHostingController(rootView: sut)
        assertSnapshot(matching: vc, as: .image(on: .iPhone13Pro, precision: 0.95))
    }

    func test_exchangesError_state() {
        viewModel.errorMessage = "Failed to load exchanges"
        viewModel.exchanges = []

        let vc = UIHostingController(rootView: sut)
        assertSnapshot(matching: vc, as: .image(on: .iPhone13Pro, precision: 0.95))
    }

    func test_exchangesSuccess_state() {
        viewModel.exchanges = [
            ExchangeModel.makeDummy(id: "MERCADOBITCOIN", name: "Mercado Bitcoin"),
            ExchangeModel.makeDummy(id: "COINBASE", name: "Coinbase")
        ]
        viewModel.errorMessage = nil

        let vc = UIHostingController(rootView: sut)
        assertSnapshot(matching: vc, as: .image(on: .iPhone13Pro, precision: 0.95))
    }
}
