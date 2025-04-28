//
//  ExchangeListConstructor.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import Foundation

internal enum ExchangeListConstructor: NetworkConstructor {
    case getExchanges
    
    internal var path: String {
        switch self {
        case .getExchanges:
            return "/v1/exchanges"
        }
    }
    
    internal var method: NetworkMethod {
        switch self {
        case .getExchanges:
            return .get
        }
    }
    
    internal var headers: NetworkHeader {
        switch self {
        case .getExchanges:
            return [:]
        }
    }
    
    internal var encoding: NetworkEncoder {
        switch self {
        case .getExchanges:
            return .urlEncoding
        }
    }
    
    internal var parameters: Parameters? {
        switch self {
        case .getExchanges:
            return [:]
        }
    }
}
