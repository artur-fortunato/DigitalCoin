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
    var delegate: CoinsDetailsViewModelDelegate?
    // MARK: - Constructors
    init(client: CoinsServiceProtocol = CoinService()){
        self.client = client
    }
    
    func loadCoin(){
        client.getCoins { (coin, error) in
            self.delegate?.reloadData(coin: CoinsDetailsViewData(model: coin!))
        }
    }
}
