//
//  HomeView.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import SwiftUI

internal struct ExchangeListView<ViewModel: ExchangeListViewModelProtocol>: View {
    @StateObject private var viewModel: ViewModel
    @EnvironmentObject private var appCoordinator: AppCoordinator
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            Group {
                if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else if viewModel.exchanges.isEmpty {
                    ProgressView()
                        .scaleEffect(1.5)
                } else {
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 0) {
                            ForEach(viewModel.exchanges) { exchange in
                                ExchangeRow(exchange: exchange)
                                    .onTapGesture {
                                        if let exchangeId = exchange.id {
                                            appCoordinator.push(.detail(exchangeId: exchangeId))
                                        }
                                    }
                                Divider()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Exchanges")
            .onAppear {
                viewModel.loadExchanges()
            }
        }
    }
}

#Preview {
    ExchangeListView(viewModel: ExchangeViewModel())
}
