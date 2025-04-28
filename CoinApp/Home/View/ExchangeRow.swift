//
//  ExchangeRow.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 26/04/25.
//

import SwiftUI

struct ExchangeRow: View {
    let exchange: ExchangeModel
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 4) {
                Text(exchange.name ?? (exchange.id ?? "—"))
                    .font(.headline)
                Text(exchange.id ?? "—")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if let volume = exchange.volume1dayUsd {
                VStack(alignment: .trailing, spacing: 2) {
                    Text(volume, format: .currency(code: "USD"))
                        .font(.subheadline)
                        .foregroundColor(.green)
                    Text("1 day")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
        }
        .contentShape(Rectangle()) 
        .padding(.vertical, 16)
        .padding(.horizontal)
    }
}
