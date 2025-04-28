//
//  AppCoordinatorProtocol.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import SwiftUI

protocol AppCoordinatorProtocol: ObservableObject {
    var path: NavigationPath { get set }
    
    func push(_ screen: Screen)
    func pop()
    func popToRoot()
}
