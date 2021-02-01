//
//  CoinsDetailsAccessibility+.swift
//  DigitalCoin
//
//  Created by Aloisio Formento Junior on 01/02/21.
//

import Foundation
extension CoinsDetailsViewController{
    func setupAccessibility(){
        lblValue.isAccessibilityElement = true
        lblLastHour.isAccessibilityElement = true
        lblLastHourValue.isAccessibilityElement = true
        lblLastDay.isAccessibilityElement = true
        lblLastDayValue.isAccessibilityElement = true
        lblLastMonth.isAccessibilityElement = true
        lblLastDayValue.isAccessibilityElement = true
        lblLastDayValue.isAccessibilityElement = true
        tradedVolume.isAccessibilityElement = true
             buttonFavorito.isAccessibilityElement = true
             labelRate.accessibilityValue = viewModel?.valorMoeda?.price_usd
             viewCabecalho.isAccessibilityElement = true
             viewCorpo.isAccessibilityElement = true
             viewCabecalho.accessibilityLabel = "Neste espaço está contido a imagem da moeda, sua sigla e seu valor atual e o botão para adicionar aos favoritos"
             viewCorpo.accessibilityLabel = "Neste espaço está contido os valores da moeda selecionada na última hora, dia e mês"
             buttonFavorito.setTitle("Adicionar", for: .normal)
             buttonFavorito.accessibilityLabel = "Adicionar ou Remover Favoritos"
             buttonFavorito.accessibilityHint = "Adicionar e Retirar a moeda aos Favoritos"

             self.accessibilityElements = [ buttonFavorito!]
    }
}
