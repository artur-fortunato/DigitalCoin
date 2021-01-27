//
//  CoinsFavoritesViewController.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/27/21.
//

import Foundation

protocol CoinsFavoritesViewModelDelegate {
    func reloadData(coin: CoinsFavoritesViewData)
}

class CoinsFavoritesViewModel {
    // MARK: - Properts
    private let client: CoinsServiceProtocol
    var viewData: Bindable<[CoinsFavoritesViewData]> = Bindable([])
    var delegate: CoinsFavoritesViewModelDelegate?
    // MARK: - Constructors
    init(client: CoinsServiceProtocol = CoinService()){
        self.client = client
    }
}
