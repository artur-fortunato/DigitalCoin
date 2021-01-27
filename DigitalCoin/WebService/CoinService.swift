
//
//  CoinsAPI.swift
//  testandoAPI
//
//  Created by Aloisio Formento Junior on 21/01/21.
//

import UIKit
import Alamofire


class CoinsAPI{

    //    private let urlAPI = "https://e6e6bed0-453a-4fee-88e2-fab778bfdcaa.mock.pstmn.io"
    
    func getCoins(completion:@escaping (_ coins:[Coin]?, _ error:String?) -> Void ) {
        
        let url = "https://ee4fd70e-9e0b-4eaf-b1aa-fe0288d5846f.mock.pstmn.io/v1/api"
        
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
    
//    func coinsList(){
//      
//              guard let urlResult = URL(string: urlAPI)else{return}
//      
//              let request = URLRequest(url:urlResult)
//      
//              let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
//      
//                     if let error = error {
//                         print(error)
//                         return
//                     }
//      
//                     // Parse JSON data
//                     if let data = data {
//                        do {
//                            let result = try JSONDecoder().decode([CoinsModel].self, from: data)
//                            self.coins.append(contentsOf: result)
//                            DispatchQueue.main.async{
//                                self.cl?.coinstableView.reloadData()
//                            }
//                        } catch let error{
//                            print(error.localizedDescription)
//                        }
//                     }
//                 })
//      
//                 task.resume()
//          }
}


