//
//  FakeNetworkService.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 27/04/25.
//

import XCTest
@testable import CoinApp

final class NetworkServiceMock: NetworkServiceProtocol {
    private(set) var lastConstructor: NetworkConstructor?
    private var _completion: ((Result<[ExchangeModel]?, Error>) -> Void)?

    func request<T: Decodable>(constructor: NetworkConstructor,
                               completion: @escaping (Result<T?, Error>) -> Void) {
        lastConstructor = constructor

        _completion = { result in
            switch result {
            case .success(let any):
                completion(.success(any as? T))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    func completeSuccess(_ data: [ExchangeModel]?) {
        _completion?(.success(data))
    }
    
    func completeFailure(_ error: Error) {
        _completion?(.failure(error))
    }
}

enum DummyError: Error, Equatable {
    case any
}
