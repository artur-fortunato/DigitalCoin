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
    
    
    func getCoins(completion:@escaping (_ coins:[WelcomeElement]?, _ error:String?) -> Void ) {
        
        let url = "https://de9e8ec7-6202-46ca-b30f-ae87f405a744.mock.pstmn.io/"
        
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


