//
//  CoinsDetailsViewModel.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/27/21.
//

import Foundation

class CoinsDetailsViewModel {
    // MARK: - Properts
    var coin: [String] = []
    let userDF = UserDefaults.standard
    var viewData: CoinsViewData?
    // MARK: - Constructors
    init(viewData: CoinsViewData?) {
        self.viewData = viewData
    }
    func saveFavorites(_ assetID: String) -> Bool? {
        if coin.contains(assetID) {
            coin = coin.filter { $0 != assetID}
            userDF.set(coin, forKey: "favorites")
            return false
        } else {
            guard let saveValue = assetID as? String else {return false}
            let savedArray = userDF.array(forKey: "favorites") as? [String]
            coin = savedArray ?? []
            coin.append(saveValue)
            userDF.set(coin, forKey: "favorites")
            return true
        }
    }
    func checkFavorites(_ assetID: String) -> Bool {
        let savedArray = userDF.array(forKey: "favorites") as? [String]
        coin = savedArray ?? []
            if coin.contains(assetID) {
                return true
            } else {
                return false
            }
        }
}
