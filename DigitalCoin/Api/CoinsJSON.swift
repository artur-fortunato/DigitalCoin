//
//  CoinsJSON.swift
//  testandoAPI
//
//  Created by Aloisio Formento Junior on 21/01/21.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
class WelcomeElement: Codable {
    let assetID, name: String?
    let typeIsCrypto: Int?
    let dataStart, dataEnd, dataQuoteStart, dataQuoteEnd: String?
    let dataOrderbookStart, dataOrderbookEnd, dataTradeStart, dataTradeEnd: String?
    let dataSymbolsCount: Int?
    let volume1HrsUsd: Double?
    let volume1DayUsd: Double?
    let volume1MthUsd: Double?
    let priceUsd: Double?
    let idIcon: String?

    enum CodingKeys: String, CodingKey {
        case assetID = "asset_id"
        case name
        case typeIsCrypto = "type_is_crypto"
        case dataStart = "data_start"
        case dataEnd = "data_end"
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataSymbolsCount = "data_symbols_count"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
        case priceUsd = "price_usd"
        case idIcon = "id_icon"
    }

    init(assetID: String?, name: String?, typeIsCrypto: Int?, dataStart: String?, dataEnd: String?, dataQuoteStart: String?, dataQuoteEnd: String?, dataOrderbookStart: String?, dataOrderbookEnd: String?, dataTradeStart: String?, dataTradeEnd: String?, dataSymbolsCount: Int?, volume1HrsUsd: Double?, volume1DayUsd: Double?, volume1MthUsd: Double?, priceUsd: Double?, idIcon: String?) {
        self.assetID = assetID
        self.name = name
        self.typeIsCrypto = typeIsCrypto
        self.dataStart = dataStart
        self.dataEnd = dataEnd
        self.dataQuoteStart = dataQuoteStart
        self.dataQuoteEnd = dataQuoteEnd
        self.dataOrderbookStart = dataOrderbookStart
        self.dataOrderbookEnd = dataOrderbookEnd
        self.dataTradeStart = dataTradeStart
        self.dataTradeEnd = dataTradeEnd
        self.dataSymbolsCount = dataSymbolsCount
        self.volume1HrsUsd = volume1HrsUsd
        self.volume1DayUsd = volume1DayUsd
        self.volume1MthUsd = volume1MthUsd
        self.priceUsd = priceUsd
        self.idIcon = idIcon
    }
}

typealias Welcome = [WelcomeElement]
