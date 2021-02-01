//
//  TelaPrincipalTableCellViewModel.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 30/01/21.
//

import Foundation

class TelaPrincipalTableCellViewModel {
    var viewData: Bindable<CoinsViewData?> = Bindable(nil)
    var coin: [String] = []
    let userDF = UserDefaults.standard
    // MARK: - Constructors
    func loadCoin(viewData: CoinsViewData?) {
        self.viewData.value = viewData
    }
}
