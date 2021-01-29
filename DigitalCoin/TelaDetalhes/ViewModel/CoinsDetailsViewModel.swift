//
//  CoinsDetailsViewModel.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/27/21.
//

import Foundation

//protocol CoinsDetailsViewModelDelegate {
//    func reloadData(coin: CoinsViewData)
//}

class CoinsDetailsViewModel {
    // MARK: - Properts
    var viewData: CoinsViewData?
    // MARK: - Constructors
    init(viewData: CoinsViewData?) {
        self.viewData = viewData
    }
}
