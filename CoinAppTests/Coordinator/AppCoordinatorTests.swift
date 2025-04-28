//
//  AppCoordinatorTests.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 27/04/25.
//

import XCTest
import SwiftUI
@testable import CoinApp

final class AppCoordinatorTests: XCTestCase {

    var coordinator: AppCoordinator!

    override func setUp() {
        super.setUp()
        coordinator = AppCoordinator()
    }

    override func tearDown() {
        coordinator = nil
        super.tearDown()
    }

    func test_initialPath_isEmpty() {
        XCTAssertTrue(coordinator.path.isEmpty)
    }

    func test_push_appendsScreenToPath() {
        let screen: Screen = .detail(exchangeId: "ABC123")
        
        coordinator.push(screen)
        
        XCTAssertEqual(coordinator.path.count, 1)
    }

    func test_pop_removesLastScreen() {
        let screen1: Screen = .home
        let screen2: Screen = .detail(exchangeId: "XYZ")
        coordinator.push(screen1)
        coordinator.push(screen2)
        XCTAssertEqual(coordinator.path.count, 2)
        
        coordinator.pop()
        
        XCTAssertEqual(coordinator.path.count, 1)
        
        coordinator.pop()
        XCTAssertTrue(coordinator.path.isEmpty)
    }

    func test_popToRoot_clearsEntirePath() {
        coordinator.push(.home)
        coordinator.push(.detail(exchangeId: "A"))
        coordinator.push(.detail(exchangeId: "B"))
        XCTAssertEqual(coordinator.path.count, 3)
        
        coordinator.popToRoot()
        
        XCTAssertTrue(coordinator.path.isEmpty)
    }

    func test_popToRoot_onEmpty_doesNothing() {
        coordinator.popToRoot()
        XCTAssertTrue(coordinator.path.isEmpty)
    }

}
