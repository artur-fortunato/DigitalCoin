////
////  CoinAPIImagem.swift
////  testandoAPI
////
////  Created by Aloisio Formento Junior on 22/01/21.
////
//
//import UIKit
//import Alamofire
//import CoreData
//
//class CoinsAPIImagem: NSObject {
//    
//    
//    func getCoins2(completion:@escaping (_ coins:[WelcomeElement2]?, _ error:String?) -> Void ) {
//        
//        let url = "https://fc7ed954-6de2-458b-a962-a391d7302e61.mock.pstmn.io/"
//        
//        Alamofire.request(url, method: .get).responseJSON { (response) in
//            if let data = response.data {
//                do {
//                    let decoder = JSONDecoder()
//                    let welcome2 = try decoder.decode(Welcome2.self, from: data)
//                    completion(welcome2, nil)
//                } catch let error {
//                    print(error)
//                    completion(nil, error.localizedDescription)
//                }
//            }else{
//                completion(nil, "Data null")
//            }
//        }
//    }
//}
