//
//  CoinsFavoritesCellViewModel.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 29/01/21.
//

import Foundation

class CoinsFavoritesCellViewModel {
    // MARK: - Properts
    var viewData: CoinsViewData?
    var userDefaults = UserDefaults.standard
    // MARK: - Constructors
    init(viewData: CoinsViewData?) {
        self.viewData = viewData
    }
}
