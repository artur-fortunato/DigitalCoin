//
//  UserDefaults+Extension.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 29/01/21.
//

import Foundation

extension UserDefaults {
    
    func setValue(_ coin: CoinsViewData) {
        if coin != nil {
            UserDefaults.standard.set(coin, forKey: "")
        } else {
            UserDefaults.standard.removeObject(forKey: "")
        }
        UserDefaults.standard.synchronize()
    }
    
    func getValue() -> Bool? {
        return UserDefaults.standard.value(forKey: "Aceito") as? Bool
    }
}
