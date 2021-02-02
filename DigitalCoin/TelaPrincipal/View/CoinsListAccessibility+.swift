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
        lblCoin.accessibilityHint = "O nome do aplicativo"
        lblDate.accessibilityTraits = .none
        lblDate.accessibilityHint = "O dia de hoje"
        searchCoin.isAccessibilityElement = true
        searchCoin.accessibilityTraits = .searchField
        searchCoin.accessibilityHint = "Digite o nome da moeda que desejas"
    }
}

extension TelaPrincipalTableViewCell{
    func setupAcessibility() {
        labelnomeMoeda.isAccessibilityElement = true
        labelnomeMoeda.accessibilityTraits = .staticText
        labelnomeMoeda.accessibilityHint = "O nome da moeda digital"
        labelSiglaCoin.isAccessibilityElement = true
        labelSiglaCoin.accessibilityTraits = .staticText
        labelSiglaCoin.accessibilityHint = "A sigla da moeda"
        labelValorCoin.isAccessibilityElement = true
        labelValorCoin.accessibilityTraits = .staticText
        labelValorCoin.accessibilityHint = "o valor em dólares de uma unidade da moeda"
        self.accessibilityElements = [labelnomeMoeda,labelSiglaCoin,labelValorCoin]
    }
}
