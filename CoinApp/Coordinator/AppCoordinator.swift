//
//  AppCoordinator.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import SwiftUI

final class AppCoordinator: AppCoordinatorProtocol {
    @Published var path = NavigationPath()
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
