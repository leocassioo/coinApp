//
//  ExchangeDetailConstructorTests.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 27/04/25.
//

import XCTest
@testable import CoinApp

final class ExchangeDetailConstructorTests: XCTestCase {
    
    func test_getExchange_pathIncludesExchangeId() {
        let constructor = ExchangeDetailConstructor.getExchange(exchangeId: "ABC123")
        XCTAssertEqual(constructor.path, "/v1/exchanges/ABC123")
    }
    
    func test_getExchange_usesGETMethod() {
        let constructor = ExchangeDetailConstructor.getExchange(exchangeId: "anything")
        XCTAssertEqual(constructor.method, .get)
    }
    
    func test_getExchange_headersIsEmpty() {
        let constructor = ExchangeDetailConstructor.getExchange(exchangeId: "X")
        XCTAssertTrue(constructor.headers.isEmpty)
    }
    
    func test_getExchange_encodingIsUrl() {
        let constructor = ExchangeDetailConstructor.getExchange(exchangeId: "X")
        XCTAssertEqual(constructor.encoding, .urlEncoding)
    }
    
    func test_getExchange_parametersIsEmptyDictionary() {
        let constructor = ExchangeDetailConstructor.getExchange(exchangeId: "X")
        XCTAssertNotNil(constructor.parameters)
        if let params = constructor.parameters {
            XCTAssertTrue(params.isEmpty)
        }
    }
}
