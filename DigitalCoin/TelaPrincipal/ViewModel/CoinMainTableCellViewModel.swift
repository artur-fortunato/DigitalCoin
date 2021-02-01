//
//  CoinMainTableCellViewModel.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 01/02/21.
//

import Foundation

class CoinMainTableCellViewModel {
    var viewData: Bindable<CoinsViewData?> = Bindable(nil)
    var coin: [String] = []
    let userDF = UserDefaults.standard
    // MARK: - Constructors
    func loadCoin(viewData: CoinsViewData?) {
        self.viewData.value = viewData
    }
}
