//
//  CoinsViewData.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 29/01/21.
//

import Foundation

protocol CoinsViewDataType {
    var name: String {get}
    var assetID: String {get}
    var priceUsd: String {get}
    var idIcon: String {get}
    var volume1HrsUsd: String {get}
    var volume1Day: String {get}
    var volume1MthUsd: String {get}
    var favorites: Bool {get}
}

class CoinsViewData {
    // MARK: - Properts
    private let imagem = TelaPrincipalTableViewCell()
    private let model: Coin
    // MARK: - Constructors
    init(model: Coin) {
        self.model = model
    }
}

extension CoinsViewData: CoinsViewDataType {
    var volume1HrsUsd: String {
        let value = model.volume1HrsUsd ?? 0
        let stringVolume1HrsUsd = String(format: "$ %.2f", locale: Locale.current, Double(value))
        return stringVolume1HrsUsd
    }
    var volume1Day: String {
        let value = model.volume1DayUsd ?? 0
        let stringVolume1DayUsd = String(format: "$ %.2f", locale: Locale.current, Double(value))
        return stringVolume1DayUsd
    }
    var volume1MthUsd: String {
        let value = model.volume1MthUsd ?? 0
        let stringVolume1MthUsd = String(format: "$ %.2f", locale: Locale.current, Double(value))
        return stringVolume1MthUsd
    }
    var idIcon: String {
        guard let idIcon = model.idIcon else {return ""}
        let idIconFormat = idIcon.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
        let urlImage = "https://s3.eu-central-1.amazonaws.com/bbxt-static-icons/type-id/png_64/\(idIconFormat).png"
        return urlImage
    }
    var name: String {
        return model.name ?? ""
    }
    var assetID: String {
        return model.assetID ?? ""
    }
    var priceUsd: String {
        let value = model.priceUsd ?? 0
        let stringPriceUsd = String(format: "$ %.2f", locale: Locale.current, Double(value))
        return stringPriceUsd
    }
    var favorites: Bool {
        guard let arrayFavorites = UserDefaults.standard.array(forKey: "favorites") as? [String] else {return false}
        if arrayFavorites.contains(assetID) {
            return true
        } else {
            return false
        }
    }
}
