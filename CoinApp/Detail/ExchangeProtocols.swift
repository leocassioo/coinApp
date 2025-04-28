//
//  ExchangeProtocols.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import Foundation

internal protocol ExchangeDetailInputProtocol: AnyObject {
    var output: ExchangeDetailOutputProtocol? { get set }
    func fetchExchange(exchangeId: String)
}

internal protocol ExchangeDetailOutputProtocol: AnyObject {
    func fetchExchangeSuccess(exchange: [ExchangeModel]?)
    func fetchExchangeFailure(error: Error)
}

protocol ExchangeDetailViewModelProtocol: ObservableObject {
    var exchange: ExchangeModel? { get }
    var errorMessage: String? { get }
    func loadDetail()
}
