//
//  SpyExchangeDetailViewModel.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 28/04/25.
//

import Foundation
@testable import CoinApp

final class ExchangeDetailViewModelSpy: ExchangeDetailViewModelProtocol, ObservableObject {
    @Published var exchange: ExchangeModel?
    @Published var errorMessage: String?

    private(set) var loadDetailCalled = false

    func loadDetail() {
        loadDetailCalled = true
    }
}
