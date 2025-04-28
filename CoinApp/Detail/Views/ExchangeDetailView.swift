//
//  DetailView.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import SwiftUI

struct ExchangeDetailView<ViewModel: ExchangeDetailViewModelProtocol>: View {
    @StateObject private var viewModel: ViewModel
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @Environment(\.openURL) private var openURL
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        Group {
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
                
            } else if let exchange = viewModel.exchange {
                ScrollView {
                    VStack(spacing: 16) {
                        Text(exchange.name ?? (exchange.id ?? "—"))
                            .font(.largeTitle).bold()
                        Text(exchange.id ?? "—")
                            .font(.subheadline).foregroundColor(.secondary)
                        
                        ChartView(exchange: exchange)
                        
                        ExchangeDetailInfoRow(exchange: exchange)
                        
                        if let website = exchange.website,
                           let url = URL(string: website) {
                            Button("Visit Website") {
                                openURL(url)
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.blue)
                            .controlSize(.large)
                        }
                        
                    }
                    .padding()
                }
                
            } else {
                ProgressView().scaleEffect(1.5)
            }
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
        .task { viewModel.loadDetail() }
    }
    
}

#Preview {
    ExchangeDetailView(viewModel: ExchangeDetailViewModel(exchangeId: "MERCADOBITCOIN"))
}
