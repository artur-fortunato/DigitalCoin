
//
//  CoinsAPI.swift
//  testandoAPI
//
//  Created by Aloisio Formento Junior on 21/01/21.
//

import UIKit
import Alamofire

protocol CoinsServiceProtocol {
    func getCoins(completion:@escaping (_ coins:Welcome, _ error:String?) -> Void )
//    func getCoinsImage(completion:@escaping (_ coins:[CoinImage], _ error:String?) -> Void )
}

class CoinService: CoinsServiceProtocol {
    func getCoins(completion:@escaping (_ coins:Welcome, _ error:String?) -> Void ) {
        let url = "https://rest.coinapi.io/v1/assets?apikey=98BD8F47-4B1B-45DE-BCA2-038D7571BA3S"
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let welcome = try decoder.decode(Welcome.self, from: data)
                    let filtroTypeIsCrypto = welcome.filter {$0.typeIsCrypto == 1}
                    let filtroUSD = filtroTypeIsCrypto.filter({$0.priceUsd != nil})
                    completion(filtroUSD, nil)
                } catch {
                    if let errorApi = response.response?.statusCode {
                    switch (errorApi) {
                    case 400:
                        let title = String("Bad Request")
                        let message = String("There is something wrong with your request")
                        ErroAPI().erroAlert(title: title, message: message)
                    case 401:
                        let title = String("Unauthorized")
                        let message = String("Your API key is wrong")
                        ErroAPI().erroAlert(title: title, message: message)
                    case 403:
                        let title = String("Forbidden")
                        let message = String("Your API key doesnt't have enough privileges to access this resource")
                        ErroAPI().erroAlert(title: title, message: message)
                    case 429:
                        let title = String("Too many requests")
                        let message = String("You have exceeded your API key rate limits")
                        ErroAPI().erroAlert(title: title, message: message)
                    case 550:
                        let title = String("No data")
                        let message = String("You requested specific single item that we don't have at this")
                        ErroAPI().erroAlert(title: title, message: message)
                    default:
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
}
