//
//  CoinsListViewData.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/27/21.
//

import Foundation

protocol CoinsListViewDataType {
    var name: String {get}
    var assetID: String {get}
    var priceUsd: String {get}
}

class CoinsListViewData {
    // MARK: - Properts
    private let model: Coin
    // MARK: - Constructors
    init(model: Coin) {
        self.model = model
    }
}
extension CoinsListViewData: CoinsListViewDataType {
    var name: String {
        return model.name
    }
    var assetID: String {
        return model.assetID
    }
    var priceUsd: String {
        let value = model.priceUsd ?? 0
        let stringPriceUsd = String(format: "$ %.2f", value)
        return stringPriceUsd
    }
}
