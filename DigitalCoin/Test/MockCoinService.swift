//
//  MockCoinService.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/29/21.
//

import Foundation

class MockCoinService : CoinsServiceProtocol {
    var isFetchCoinsCalled = false
    var isError = 0
    var coins : [Coin] = [Coin]()
    func getCoins(completion: @escaping (Welcome, _ error:String?) -> Void) {
        isFetchCoinsCalled = true
        isError = 400
    }
}
