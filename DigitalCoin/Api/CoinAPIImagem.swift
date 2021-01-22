//
//  CoinAPIImagem.swift
//  testandoAPI
//
//  Created by Aloisio Formento Junior on 22/01/21.
//

import UIKit
import Alamofire
import CoreData

class CoinsAPIImagem: NSObject {
    
    var listaCoins2 = [String]()
    
    func getCoins2(completion:@escaping (_ coins:[WelcomeElement2]?, _ error:String?) -> Void ) {
        
        let url = "https://rest.coinapi.io/v1/assets/icons/32?apikey=98BD8F47-4B1B-45DE-BCA2-038D7571BA3C"
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let welcome2 = try decoder.decode(Welcome2.self, from: data)
                    completion(welcome2, nil)
                } catch let error {
                    print(error)
                    completion(nil, error.localizedDescription)
                }
            }else{
                completion(nil, "Data null")
            }
        }
    }
}
