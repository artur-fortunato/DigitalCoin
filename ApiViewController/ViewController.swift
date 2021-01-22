//
//  ViewController.swift
//  testandoAPI
//
//  Created by Aloisio Formento Junior on 21/01/21.
//

import UIKit
import AlamofireImage
import Alamofire

class ViewController: UIViewController {
    
    var coins: Welcome? = []
    var coins2: Welcome2? = []
    var getAllName = [String]()
    var getAllUsd = [Double]()
    var getAllUrl = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataName()
        getDataUsd()
        getDataImagem()
        
    }
    
    func getDataName() {
        CoinsAPI().getCoins { (coinsArray, erro) in
            if let error = erro {
                print(error)
            }else if let coins = coinsArray{
                self.coins = coins
                for x in 0..<coins.count{
                    let allSingleValue = coins[x]
                    let allNames = allSingleValue.name
                    self.getAllName.append(allNames)
                }
            }
        }
    }
    
    func getDataUsd() {
        CoinsAPI().getCoins { (coinsArray, erro) in
            if let error = erro {
                print(error)
            }else if let coins = coinsArray{
                self.coins = coins
                for x in 0..<coins.count{
                    let allSingleValue = coins[x]
                    let allUsd = allSingleValue.priceUsd
                    self.getAllUsd.append(allUsd ?? 0.00)
                }
            }
        }
    }
    
    func getDataImagem() {
        CoinsAPIImagem().getCoins2 { (coinsArray, erro) in
            if let error = erro {
                print(error)
            }else if let coins = coinsArray{
                self.coins2 = coins
                for x in 0..<coins.count{
                    let allSingleValue = coins[x]
                    let allUrl = allSingleValue.url
                    self.getAllUrl.append(allUrl)
                }
                print (self.getAllUrl)
            }
        }
    }
}
    
    




