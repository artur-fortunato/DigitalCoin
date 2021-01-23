////
////  CoinService.swift
////  DigitalCoin
////
////  Created by Artur Rodrigues Fortunato on 22/01/21.
////
//
//import Foundation
//import Alamofire
//
//
//protocol CoinsServiceProtocol{
//    func getCoin(completionHandler: @escaping([Coin]) -> Void)
//}
//
//
//class CoinService: CoinsServiceProtocol{
//    
//    private let url = "https://b993dcbf-4ae6-4118-8f63-ce30481e35ba.mock.pstmn.io/v1/assets"
//    
//    func getCoin(completionHandler: @escaping ([Coin]) -> Void) {
//        guard let url = URL(string: url) else {return}
//        
//        Alamofire.request(url, method: .get).responseJSON { (response) in
//            
//            switch response.result{
//            case .success:
//                    if let data = response.data{
//                        do{
//                            let decoder = JSONDecoder()
//                            let coinResponse = try decoder.decode(Coins.self, from: data)
//                            DispatchQueue.main.async {
//                                completionHandler(coinResponse)
//                            }
//                            
//                        }
//                        catch let error{
//                            print(error)
//                        }
//                    }
//                break
//            case .failure:
//                print("Error")
//                break
//            }
//
//        }
//    }
//}
