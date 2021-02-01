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
    private let client: CoinsServiceProtocol
    var viewData: Bindable<[CoinsViewData]> = Bindable([])
    var arrayCoinSearch: [CoinsViewData] = []
    var userDF = UserDefaults.standard.array(forKey: "favorites")
    // MARK: - Constructors
    init(client: CoinsServiceProtocol = CoinService()) {
        self.client = client
        self.loadCoin()
    }
    func loadCoin() {
        client.getCoins { (responseCoin, error) in
            for coin in responseCoin {
                self.viewData.value.append(CoinsViewData(model: coin))
            }
        }
    }
    func numberCell() -> Int {
        return userDF? .count ?? 0
    }
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
