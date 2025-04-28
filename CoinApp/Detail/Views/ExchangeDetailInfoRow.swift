//
//  ExchangeDetailInfoGridItem.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 27/04/25.
//

import SwiftUI

private struct InfoField: Identifiable {
    let id = UUID()
    let title: String
    let value: String
}

struct ExchangeDetailInfoRow: View {
    let exchange: ExchangeModel
    
    private let isoFormatter: ISO8601DateFormatter = {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]
        return isoFormatter
    }()
    
    private let displayFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMM d, yyyy"
        df.locale = .current
        return df
    }()
    
    private struct InfoField: Identifiable {
        let id = UUID()
        let title: String
        let value: String
    }
    
    private var fields: [InfoField] {
        var result: [InfoField] = []
        
        func formatDate(_ iso: String?, title: String) {
            guard let iso = iso,
                  let date = isoFormatter.date(from: iso) else {
                result.append(.init(title: title, value: "—"))
                return
            }
            result.append(.init(title: title, value: displayFormatter.string(from: date)))
        }
        
        if let dataQuoteStart = exchange.dataQuoteStart, let dataQuoteEnd = exchange.dataQuoteEnd {
            formatDate(dataQuoteStart, title: "Quote Start")
            formatDate(dataQuoteEnd, title: "Quote End")
        }
        
        if let dataOrderbookStart = exchange.dataOrderbookStart, let dataOrderbookEnd = exchange.dataOrderbookEnd {
            formatDate(dataOrderbookStart, title: "Orderbook Start")
            formatDate(dataOrderbookEnd, title: "Orderbook End")
        }
        
        if let dataTradeStart = exchange.dataTradeStart, let dataTradeEnd = exchange.dataTradeEnd {
            formatDate(dataTradeStart, title: "Trade Start")
            formatDate(dataTradeEnd, title: "Trade End")
        }
        
        if let dataSymbolsCount = exchange.dataSymbolsCount {
            result.append(.init(title: "Symbols Count", value: "\(dataSymbolsCount)"))
        }
        
        if let integrationStatus = exchange.integrationStatus {
            result.append(.init(title: "Integration", value: integrationStatus))
        }
        
        if let rank = exchange.rank {
            result.append(.init(title: "Rank", value: "\(rank)"))
        }
        
        return result
    }
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(fields) { field in
                VStack(alignment: .center, spacing: 4) {
                    Text(field.title)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(field.value)
                        .font(.body)
                        .foregroundColor(.primary)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.1))
                )
            }
        }
    }
}
