//
//  ExchangeListViewModelSpy.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 28/04/25.
//

import XCTest
@testable import CoinApp

final class ExchangeListViewModelSpy: ExchangeListViewModelProtocol, ObservableObject {
    @Published var exchanges: [ExchangeModel] = []
    @Published var errorMessage: String?
    func loadExchanges() { }
}
