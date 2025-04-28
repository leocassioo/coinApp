//
//  Screen.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import Foundation

enum Screen: Identifiable, Hashable {
    case home
    case detail(exchangeId: String)
    
    var id: Self { self }
}
