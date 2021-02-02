//
//  CoinsDetailsAccessibility+.swift
//  DigitalCoin
//
//  Created by Aloisio Formento Junior on 02/02/21.
//

import Foundation

extension CoinsDetailsViewController {
    func setupAcessibility() {
        lblValue.accessibilityTraits = .staticText
        lblValue.accessibilityHint = "O valor da moeda"
        buttonAdd.isAccessibilityElement = true
        buttonAdd.accessibilityTraits = .button
        buttonAdd.accessibilityHint = "Clique para adicionar ou remover uma moeda nos favoritos"
        tradedVolume.isAccessibilityElement = true
        tradedVolume.accessibilityTraits = .staticText
        lblLastHour.isAccessibilityElement = true
        lblLastHour.accessibilityTraits = .staticText
        lblLastHourValue.isAccessibilityElement = true
        lblLastHourValue.accessibilityTraits = .staticText
        lblLastDay.isAccessibilityElement = true
        lblLastDay.accessibilityTraits = .staticText
        lblLastDayValue.isAccessibilityElement = true
        lblLastDayValue.accessibilityTraits = .staticText
        lblLastMonth.isAccessibilityElement = true
        lblLastMonth.accessibilityTraits = .staticText
        lblLastMonthValue.isAccessibilityElement = true
        lblLastMonthValue.accessibilityTraits = .staticText
        star.isAccessibilityElement = true
        star.accessibilityTraits = .selected
        star.accessibilityValue = "Mostra se a moeda esta ou não favoritada"
        
        self.accessibilityElements = [star,lblValue,buttonAdd,tradedVolume,lblLastHour,lblLastHourValue,lblLastDay,lblLastDayValue,lblLastMonth,lblLastMonthValue]
        
    }
}
