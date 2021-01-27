//
//  CoinsListImageViewModel.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 27/01/21.
//

import Foundation

protocol CoinsListImageViewModelDelegate {
    func reloadDataImage(coinImage: CoinsListImageViewData)
}

class CoinsListImageViewModel {
    // MARK: - Properts
    private let client: CoinsServiceProtocol
    var viewDataImage: Bindable<[CoinsListImageViewData]> = Bindable([])
    var delegate: CoinsListImageViewModelDelegate?
    // MARK: - Constructors
    init(client: CoinsServiceProtocol = CoinService()) {
        self.client = client
        self.loadCoinImage()
    }
    func loadCoinImage() {
        client.getCoinsImage { (responseCoinImage, error) in
            for coinImage in responseCoinImage {
                self.viewDataImage.value.append(CoinsListImageViewData(modelImage: coinImage))
            }
        }
    }
}
