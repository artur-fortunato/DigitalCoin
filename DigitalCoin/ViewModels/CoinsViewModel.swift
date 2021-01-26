//
//  CoinsViewModel.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/25/21.
//

import Foundation
import Alamofire

@available(iOS 13.0, *)
class CoinsViewModel{
    
    weak var cl: CoinsListViewController?
    
    private let urlAPI = "https://e6e6bed0-453a-4fee-88e2-fab778bfdcaa.mock.pstmn.io"
    var coins = [CoinsModel]()
    
    
    func alamoCoinsList(){
        Alamofire.request(urlAPI).response{ resposta in
            if let data = resposta.data{
                do {
                    let result = try JSONDecoder().decode([CoinsModel].self, from: data)
                    self.coins.append(contentsOf: result)
                    DispatchQueue.main.async{
                        self.cl?.coinstableView.reloadData()
                    }
                } catch let error{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    func coinsList(){
      
              guard let urlResult = URL(string: urlAPI)else{return}
      
              let request = URLRequest(url:urlResult)
      
              let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
      
                     if let error = error {
                         print(error)
                         return
                     }
      
                     // Parse JSON data
                     if let data = data {
                        do {
                            let result = try JSONDecoder().decode([CoinsModel].self, from: data)
                            self.coins.append(contentsOf: result)
                            DispatchQueue.main.async{
                                self.cl?.coinstableView.reloadData()
                            }
                        } catch let error{
                            print(error.localizedDescription)
                        }
                     }
                 })
      
                 task.resume()
          }
}
