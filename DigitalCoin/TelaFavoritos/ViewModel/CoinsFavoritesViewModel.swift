//
//  CoinsFavoritesViewController.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/27/21.
//

import Foundation

//protocol CoinsFavoritesViewModelDelegate {
//    func reloadData(coin: CoinsViewData)
//}

class CoinsFavoritesViewModel {
    // MARK: - Properts
    var viewData: CoinsViewData?
    var countCoin: [String] = []
    var userDefaults = UserDefaults.standard
    // MARK: - Constructors
    
    func recoverCoin() {
        if (UserDefaults.standard.array(forKey: "favorites")) != nil {
            let loadCoinFavorite = (UserDefaults.standard.array(forKey: "favorites") as? [String])!
            self.countCoin = loadCoinFavorite
            print(loadCoinFavorite)
        }
    }
    
    func numberCell() -> Int {
        return userDefaults.array(forKey: "favorites")?.count ?? 0
    }
    
    
    func teste (_ assetID: String) {
        for assetID in countCoin {
            let localize = NSLocalizedString(assetID, comment: "")
                
            print(localize)
        }
    }

}
