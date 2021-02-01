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
    var coin: CoinsViewData?
    var coinList: CoinsListViewModel = CoinsListViewModel()
    var coinModel: Coin?
    var coinFavorites: [CoinsViewData] = []
    var arrayCoin: [CoinsViewData] = []
    var userDF = UserDefaults.standard.array(forKey: "favorites")
    // MARK: - Constructors
 
    func loadCoin() {
        guard let savedArray = userDF as? [String] else {return}
        print(savedArray)
        self.coinFavorites = coinList.viewData.value
        for item in coinFavorites {
            if coin?.favorites != false {
                self.arrayCoin.append(item)
            }
        }
    }
    
//    self.coinFavorites = self.viewData.value
//    if self.coin?.favorites != false {
//        for coin in viewData.value {
//            self.coinFavorites.append(coin)
//            }
//    }
//    // MARK: - Properts
//    var arrayCoin: [String] = []
//    var userDF = UserDefaults.standard
//    var viewData2: [CoinsViewData] = []
//    var teste: CoinsListViewModel = CoinsListViewModel()
//    // MARK: - Constructors
//    func numberCell() -> Int {
//        return userDF.array(forKey: "favorites")?.count ?? 0
//    }
//
//
//    func recoverFavorites(){
//        if (UserDefaults.standard.array(forKey: "favorites")) != nil {
//            guard let savedArray = userDF.array(forKey: "favorites") as? [String] else {return}
//            self.arrayCoin = savedArray
//        }
//        print(self.arrayCoin)
//    }
//    func setFavorites() {
//        self.viewData2 = teste.viewData.value
//    }

}
