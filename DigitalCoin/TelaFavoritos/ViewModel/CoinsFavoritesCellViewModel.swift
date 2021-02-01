//
//  CoinsFavoritesCellViewModel.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 29/01/21.
//

import Foundation
import Commons
class CoinsFavoritesCellViewModel {
    var viewData: Bindable<CoinsViewData?> = Bindable(nil)
    var coin: [String] = []
    let userDF = UserDefaults.standard
    // MARK: - Constructors
    func loadCoin(viewData: CoinsViewData?) {
        self.viewData.value = viewData
    }
}
