//
//  CoinsFavoritesViewData.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/27/21.
//

import Foundation

protocol CoinsFavoritesViewDataType {
    var name: String {get}
    var assetID: String {get}
    var priceUsd: String {get}
}

class CoinsFavoritesViewData {
    // MARK: - Properts
    private let model: Coin
    // MARK: - Constructors
    init(model: Coin) {
        self.model = model
    }
}

extension CoinsFavoritesViewData: CoinsFavoritesViewDataType {
    var name: String {
        return model.name
    }
    var assetID: String {
        return model.assetID
    }
    var priceUsd: String {
        let value = model.priceUsd ?? 0
        let stringPriceUsd = String(format: "Value: %.2f", value)
        return stringPriceUsd
    }
}


//protocol CoinsFavoritesViewDataType {
//    var name: String {get}
//    var assetID: String {get}
//    var priceUsd: String {get}
//    var coins: [Coin] {get}
//}
//
//class CoinsFavoritesViewData {
//    // MARK: - Properts
//    private let model: [Coin]
//    // MARK: - Constructors
//    init(model: [Coin]) {
//        self.model = model
//    }
//}
//
//extension CoinsFavoritesViewData: CoinsFavoritesViewDataType {
//    var coins: [Coin] {
//        return model
//    }
//    var name: String {
//        return model[0].name
//    }
//    var assetID: String {
//        return model[0].assetID
//    }
//    var priceUsd: String {
//        let value = model[0].priceUsd ?? 0
//        let stringPriceUsd = String(format: "Value: %.2f", value)
//        return stringPriceUsd
//    }
//}
