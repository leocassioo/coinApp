//
//  ExchangeDetailConstructor.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import Foundation

internal enum ExchangeDetailConstructor: NetworkConstructor {
    case getExchange(exchangeId: String)
    
    internal var path: String {
        switch self {
        case .getExchange(let exchangeId):
            return "/v1/exchanges/\(exchangeId)"
        }
    }
    
    internal var method: NetworkMethod {
        switch self {
        case .getExchange:
            return .get
        }
    }
    
    internal var headers: NetworkHeader {
        switch self {
        case .getExchange:
            return [:]
        }
    }
    
    internal var encoding: NetworkEncoder {
        switch self {
        case .getExchange:
            return .urlEncoding
        }
    }
    
    internal var parameters: Parameters? {
        switch self {
        case .getExchange:
            return [:]
        }
    }
}
