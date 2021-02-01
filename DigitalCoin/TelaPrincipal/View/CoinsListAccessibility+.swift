//
//  CoinsListAccessibility+.swift
//  DigitalCoin
//
//  Created by Aloisio Formento Junior on 01/02/21.
//

import Foundation

extension CoinsListViewController{
    func setupAcessibility() {
        lblCoin.accessibilityTraits = .header
        lblCoin.accessibilityValue = "O nome do aplicativo"
        lblDate.accessibilityTraits = .none
        lblDate.accessibilityValue = "O dia de hoje"
        searchCoin.isAccessibilityElement = true
        searchCoin.accessibilityTraits = .searchField
        searchCoin.accessibilityValue = "Digite o nome da moeda que desejas"
    }
}

extension TelaPrincipalTableViewCell{
    func setupAcessibility() {
        labelnomeMoeda.isAccessibilityElement = true
        labelnomeMoeda.accessibilityTraits = .none
        labelnomeMoeda.accessibilityValue = "O nome da moeda digital"
        labelSiglaCoin.isAccessibilityElement = true
        labelSiglaCoin.accessibilityTraits = .none
        labelSiglaCoin.accessibilityValue = "A sigla da moeda"
        labelValorCoin.isAccessibilityElement = true
        labelValorCoin.accessibilityTraits = .none
        labelValorCoin.accessibilityValue = "o valor em dólares de uma unidade da moeda"
        self.accessibilityElements = [labelnomeMoeda,labelSiglaCoin,labelValorCoin]
    }
}
