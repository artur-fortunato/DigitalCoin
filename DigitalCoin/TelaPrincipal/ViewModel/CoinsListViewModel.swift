//
//  CoinsViewModel.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/25/21.
//

import Foundation

protocol CoinsListViewModelDelegate {
    func reloadData(coin: CoinsListViewData)
}

class CoinsListViewModel {
    // MARK: - Properts
    private let client: CoinsServiceProtocol
    var viewData: Bindable<[CoinsListViewData]> = Bindable([])
    var coins: [CoinsListViewData] = []
    var delegate: CoinsListViewModelDelegate?
    // MARK: - Constructors
    init(client: CoinsServiceProtocol = CoinService()) {
        self.client = client
        self.loadCoin()
    }
    func loadCoin() {
        client.getCoins { (responseCoin, error) in
            for coin in responseCoin {
                self.viewData.value.append(CoinsListViewData(model: coin))
                self.coins = self.viewData.value
            }
        }
    }
    
    func detalhes(_ int: Int) -> CoinsListViewData{
        let teste = self.coins[int]
        
        return teste
    }
    
    func searchBar(_ coinName: String){
        if coinName == ""{
            viewData.value = coins
        } else {
            let search = coins.filter {
                let coin = $0.name.contains(coinName)
                return coin
            }
            viewData.value = search
        }
    }
}
