//
//  CoinsDetailsViewModel.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/27/21.
//

import Foundation

//protocol CoinsDetailsViewModelDelegate {
//    func reloadData(coin: CoinsViewData)
//}

class CoinsDetailsViewModel {
    // MARK: - Properts
    var coin: [String] = []
    let userDF = UserDefaults.standard
    var viewData: CoinsViewData?
    // MARK: - Constructors
    init(viewData: CoinsViewData?) {
        self.viewData = viewData
    }
    func saveFavorites(_ assetID: String?) {
        if let saveValue: String = assetID {
        let savedArray = userDF.array(forKey: "coinsFavorites") as? [String]
            coin = savedArray ?? []
        coin.append(saveValue)
        userDF.set(coin, forKey: "coinsFavorites")
        print(userDF.array(forKey: "coinsFavorites"))
        }
    }
}
