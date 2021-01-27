
//
//  CoinsAPI.swift
//  testandoAPI
//
//  Created by Aloisio Formento Junior on 21/01/21.
//

import UIKit
import Alamofire

protocol CoinsServiceProtocol {
    func getCoins(completion:@escaping (_ coins:[Coin], _ error:String?) -> Void )
}

class CoinService: CoinsServiceProtocol {
    func getCoins(completion:@escaping (_ coins:[Coin], _ error:String?) -> Void ) {
        let url = "https://ee4fd70e-9e0b-4eaf-b1aa-fe0288d5846f.mock.pstmn.io/v1/api"
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let welcome = try decoder.decode(Welcome.self, from: data)
                    completion(welcome, nil)
                } catch let error {
                    print(error)
                    completion([], error.localizedDescription)
                }
            } else {
                completion([], "Data null")
            }
        }

    }
}
