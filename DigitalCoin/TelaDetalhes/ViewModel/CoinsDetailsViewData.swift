//
//  CoinsDetailsViewData.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/27/21.
//

import Foundation

protocol CoinsDetailsViewDataType {
    var assetID: String {get}
    var priceUsd: String {get}
    var volume1HrsUsd: String {get}
    var volume1DayUsd: String {get}
    var volume1MthUsd: String {get}
}

class CoinsDetailsViewData {
    // MARK: - Properts
    private let model: Coin
    // MARK: - Constructors
    init(model: Coin) {
        self.model = model
    }
}

extension CoinsDetailsViewData: CoinsDetailsViewDataType {
    var coins: Coin {
        return model
    }
    var assetID: String {
        return model.assetID ?? ""
    }
    var priceUsd: String {
        let value = model.priceUsd ?? 0
        let stringPriceUsd = String(format: "Value: %.4f", value)
        return stringPriceUsd
    }
    var volume1HrsUsd: String {
        let value = model.volume1HrsUsd
        let stringVolume1HrsUsd = String(format: "Value: %.4f", value as! CVarArg)
        return stringVolume1HrsUsd
    }
    var volume1DayUsd: String {
        let value = model.volume1DayUsd
        let stringVolume1DayUsd = String(format: "Value: %.4f", value as! CVarArg)
        return stringVolume1DayUsd
    }
    var volume1MthUsd: String {
        let value = model.volume1MthUsd
        let stringVolume1MthUsd = String(format: "Value: %.4f", value as! CVarArg)
        return stringVolume1MthUsd
    }
}
