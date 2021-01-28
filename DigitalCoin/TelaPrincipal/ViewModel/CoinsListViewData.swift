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
    var idIcon: String {get}
}

class CoinsListViewData {
    // MARK: - Properts
    private let imagem = TelaPrincipalTableViewCell()
    private let model: Coin
    // MARK: - Constructors
    init(model: Coin) {
        self.model = model
    }
}

extension CoinsListViewData: CoinsListViewDataType {
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
        let stringPriceUsd = String(format: "$ %.4f", value)
        return stringPriceUsd
    }
}
