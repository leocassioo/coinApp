//
//  HomeProtocols.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import SwiftUI

internal protocol ExchangeListInputProtocol: AnyObject {
    var output: ExchangeListOutputProtocol? { get set }
    func fetchExchanges()
}

internal protocol ExchangeListOutputProtocol: AnyObject {
    func fetchExchangesSuccess(exchanges: [ExchangeModel]?)
    func fetchExchangesFailure(error: Error)
}

protocol ExchangeListViewModelProtocol: ObservableObject {
    var exchanges: [ExchangeModel] { get }
    var errorMessage: String? { get }
    func loadExchanges()
}
