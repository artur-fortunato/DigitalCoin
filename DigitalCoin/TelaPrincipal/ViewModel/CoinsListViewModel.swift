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
        }
    }
}
