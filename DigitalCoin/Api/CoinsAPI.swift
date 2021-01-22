//
//  CoinsAPI.swift
//  testandoAPI
//
//  Created by Aloisio Formento Junior on 21/01/21.
//

import UIKit
import Alamofire
import CoreData

class CoinsAPI: NSObject {
    
    var listaCoins = [String]()
    
    func getCoins(completion:@escaping (_ coins:[WelcomeElement]?, _ error:String?) -> Void ) {
        
        let url = "https://b993dcbf-4ae6-4118-8f63-ce30481e35ba.mock.pstmn.io/v1/assets"
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if let data = response.data {
                do {
                    let decoder = JSONDecoder()
                    let welcome = try decoder.decode(Welcome.self, from: data)
                    completion(welcome, nil)
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


