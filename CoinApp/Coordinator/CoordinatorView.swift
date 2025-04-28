//
//  CoordinatorView.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            ExchangeListView(viewModel: ExchangeViewModel())
                .environmentObject(appCoordinator)
                .navigationDestination(for: Screen.self) { screen in
                    switch screen {
                    case .home:
                        let viewModel = ExchangeViewModel()
                        ExchangeListView(viewModel: viewModel)
                    case .detail(let exchangeId):
                        let viewmodel = ExchangeDetailViewModel(exchangeId: exchangeId)
                        ExchangeDetailView(viewModel: viewmodel)
                    }
                }
        }
        .environmentObject(appCoordinator)  
    }
}
