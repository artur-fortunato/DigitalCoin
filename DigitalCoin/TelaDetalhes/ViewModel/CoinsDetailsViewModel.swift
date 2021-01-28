//
//  CoinsDetailsViewModel.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/27/21.
//

import Foundation

protocol CoinsDetailsViewModelDelegate {
    func reloadData(coin: CoinsDetailsViewData)
}

class CoinsDetailsViewModel {
    // MARK: - Properts
    private let client: CoinsServiceProtocol
    var viewData: Bindable<CoinsDetailsViewData?> = Bindable(nil)
    var delegate: CoinsDetailsViewModelDelegate?
    // MARK: - Constructors
    init(client: CoinsServiceProtocol = CoinService()) {
        self.client = client
    }

//    func loadCoinID() {
//        client.getCoins { (coin, error) in
//            self.viewData.listeners = coin.map({ return CoinsDetailsViewData(model: $0.assetID)})
//        }
//    }
}
