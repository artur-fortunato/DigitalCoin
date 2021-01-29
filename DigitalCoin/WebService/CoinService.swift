
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
        let url = "https://ee4fd70e-9e0b-4eaf-b1aa-fe0288d5846f.mock.pstmn.io/v1/api"
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
                        self.alertMessage(title, message)
                    case 401:
                        let title = String("Unauthorized")
                        let message = String("Your API key is wrong")
                        self.alertMessage(title, message)
                    case 403:
                        let title = String("Forbidden")
                        let message = String("Your API key doesnt't have enough privileges to access this resource")
                        self.alertMessage(title, message)
                    case 429:
                        print(errorApi)
                        let title = String("Too many requests")
                        let message = String("You have exceeded your API key rate limits")
                        self.alertMessage(title, message)
                    case 550:
                        let title = String("No data")
                        let message = String("You requested specific single item that we don't have at this")
                        self.alertMessage(title, message)
                    default:
                        let title = String("Ola")
                        let message = String("teste")
                        self.alertMessage(title, message)
                    }
                }
            }
        }
    }
}
    func alertMessage(_ title: String, _ message: String) {
        let alerta = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let botao = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(botao)
        }

}
