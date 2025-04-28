//
//  ChatView.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 27/04/25.
//

import SwiftUI
import Charts

struct ChartView: View {
    let exchange: ExchangeModel
    private struct VolumeData: Identifiable {
        let id = UUID()
        let period: String
        let value: Double
    }
    
    var body: some View {
        let volumes = [
            VolumeData(period: "1H", value: exchange.volume1hrsUsd ?? 0),
            VolumeData(period: "1D", value: exchange.volume1dayUsd ?? 0),
            VolumeData(period: "1M", value: exchange.volume1mthUsd ?? 0)
        ]
        
        let series = [(type: "Volume USD", petData: volumes)]
        
        Chart(series, id: \.type) { dataSeries in
            ForEach(dataSeries.petData) { item in
                LineMark(
                    x: .value("Period", item.period),
                    y: .value("Value (USD)", item.value)
                )
                .interpolationMethod(.linear)
                
                PointMark(
                    x: .value("Period", item.period),
                    y: .value("Value (USD)", item.value)
                )
            }
            .foregroundStyle(by: .value("Series", dataSeries.type))
            .symbol(by: .value("Series", dataSeries.type))
        }
        .chartYAxis {
            AxisMarks(position: .trailing) { _ in
                AxisGridLine()
                    .foregroundStyle(Color.gray.opacity(0.2))
                AxisTick()
                    .foregroundStyle(Color.gray.opacity(0.5))
                AxisValueLabel(
                    format: FloatingPointFormatStyle<Double>
                        .number
                        .precision(.fractionLength(0))
                        .grouping(.automatic)
                )
            }
        }
        .chartXScale(domain: ["1H", "1D", "1M"])
        .padding(.horizontal)
        .frame(height: 150)
    }
}
