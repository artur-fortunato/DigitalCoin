//
//  CoinsFavoritesViewController.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/27/21.
//

import Foundation

class CoinsFavoritesViewModel {
    // MARK: - Properts
    var coinList: CoinsListViewModel = CoinsListViewModel()
    var coinFavorites: [CoinsViewData] = []
    var arrayCoin: [CoinsViewData] = []
    var userDF = UserDefaults.standard.array(forKey: "favorites")
    // MARK: - Constructors
    func loadCoin() {
        guard let savedArray = userDF as? [String] else {return}
            coinFavorites = coinList.arrayFavorites
            for item in coinFavorites {
                if savedArray.contains(item.assetID) {
                    arrayCoin.append(item)
                }
            }

        }
}
