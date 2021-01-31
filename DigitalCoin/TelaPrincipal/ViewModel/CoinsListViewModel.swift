//
//  CoinsViewModel.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/25/21.
//

import Foundation

protocol CoinsListViewModelDelegate {
    func reloadData(coin: CoinsViewData)
}

class CoinsListViewModel {
    // MARK: - Properts
    private let client: CoinsServiceProtocol
    var viewData: Bindable<[CoinsViewData]> = Bindable([])
    var arrayCoinSearch: [CoinsViewData] = []
    var delegate: CoinsListViewModelDelegate?
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
            self.arrayCoinSearch = self.viewData.value
        }
    }
    func filterResults(_ searchText:String){
            var listaArray = arrayCoinSearch
            if searchText != ""{
                listaArray = listaArray.filter({ (coin) -> Bool in
                    if coin.name.lowercased().contains(searchText.lowercased()){
                        return true
                    }else {
                        return false
                    }
                })
                
            }
            self.viewData.value = listaArray
        }
}
