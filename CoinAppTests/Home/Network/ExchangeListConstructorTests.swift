//
//  ExchangeListConstructorTests.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 28/04/25.
//

import XCTest
@testable import CoinApp

final class ExchangeListConstructorTests: XCTestCase {
    
    func test_getExchanges_pathIsCorrect() {
        let constructor = ExchangeListConstructor.getExchanges
        XCTAssertEqual(constructor.path, "/v1/exchanges")
    }
    
    func test_getExchanges_usesGETMethod() {
        let constructor = ExchangeListConstructor.getExchanges
        XCTAssertEqual(constructor.method, .get)
    }
    
    func test_getExchanges_headersIsEmpty() {
        let constructor = ExchangeListConstructor.getExchanges
        XCTAssertTrue(constructor.headers.isEmpty)
    }
    
    func test_getExchanges_encodingIsUrl() {
        let constructor = ExchangeListConstructor.getExchanges
        XCTAssertEqual(constructor.encoding, .urlEncoding)
    }
    
    func test_getExchanges_parametersIsEmptyDictionary() {
        let constructor = ExchangeListConstructor.getExchanges
        XCTAssertNotNil(constructor.parameters)
        if let params = constructor.parameters {
            XCTAssertTrue(params.isEmpty)
        }
    }
}

