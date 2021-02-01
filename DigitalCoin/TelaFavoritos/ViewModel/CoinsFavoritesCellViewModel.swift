//
//  CoinsFavoritesCellViewModel.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 29/01/21.
//

import Foundation

class CoinsFavoritesCellViewModel {
    
    var viewData: Bindable<CoinsViewData?> = Bindable(nil)
    var coin: [String] = []
    let userDF = UserDefaults.standard
    // MARK: - Constructors
    func loadCoin(viewData: CoinsViewData?) {
        self.viewData.value = viewData
    }
}
//    // MARK: - Properts
//    var arrayCoin: [String] = []
//    var userDF = UserDefaults.standard
//    var viewData: Bindable<[CoinsViewData]> = Bindable([])
//    // MARK: - Constructors
//    func recoverFavorites() -> [Any] {
//        if (UserDefaults.standard.array(forKey: "favorites")) != nil {
//            guard let savedArray = userDF.array(forKey: "favorites") as? [String] else {return []}
//            self.arrayCoin = savedArray
//        }
//        return self.arrayCoin ?? []
//    }
//
//    func filterArray() {
//        var listArray = arrayCoin
//        for x in viewData.value {
//            if listArray.contains(x){
//
//            }
//        }
//
//    }
//}
//    func recoverCoin() {
//        if (UserDefaults.standard.array(forKey: "favorites")) != nil {
//            let loadCoinFavorite = (UserDefaults.standard.array(forKey: "favorites") as? [String])!
//            self.countCoin = loadCoinFavorite
//            print(loadCoinFavorite)
//        }
//    }
//
//    func reloadCell() {
//        guard let salvedArray = userDefaults.array(forKey: "favorites") as? [String] else {return}
//        coin = salvedArray ?? []
//        print(coin)
//        userDefaults.synchronize()
//    }

