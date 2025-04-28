//
//  ExchangeModelDummy.swift
//  CoinApp
//
//  Created by Leonardo Figueiredo on 27/04/25.
//

@testable import CoinApp

extension ExchangeModel {
    static func makeDummy(
        id: String = "DUMMY_EXCHANGE",
        website: String? = "https://example.com",
        name: String? = "Dummy Exchange",
        dataQuoteStart: String? = "2020-01-01T00:00:00.0000000Z",
        dataQuoteEnd: String? = "2025-12-31T23:59:59.0000000Z",
        dataOrderbookStart: String? = "2020-01-01T00:00:00.0000000Z",
        dataOrderbookEnd: String? = "2025-12-31T23:59:59.0000000Z",
        dataTradeStart: String? = "2020-01-01T00:00:00.0000000Z",
        dataTradeEnd: String? = "2025-12-31T23:59:59.0000000Z",
        dataSymbolsCount: Int? = 100,
        volume1hrsUsd: Double? = 1_000_000,
        volume1dayUsd: Double? = 10_000_000,
        volume1mthUsd: Double? = 100_000_000,
        rank: Int? = 1,
        integrationStatus: String? = "INTEGRATED"
    ) -> ExchangeModel {
        ExchangeModel(
            id: id,
            website: website,
            name: name,
            dataQuoteStart: dataQuoteStart,
            dataQuoteEnd: dataQuoteEnd,
            dataOrderbookStart: dataOrderbookStart,
            dataOrderbookEnd: dataOrderbookEnd,
            dataTradeStart: dataTradeStart,
            dataTradeEnd: dataTradeEnd,
            dataSymbolsCount: dataSymbolsCount,
            volume1hrsUsd: volume1hrsUsd,
            volume1dayUsd: volume1dayUsd,
            volume1mthUsd: volume1mthUsd,
            rank: rank,
            integrationStatus: integrationStatus
        )
    }
}
