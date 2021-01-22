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
    var getAllAssetId = [String]()
    var getAllVolumeHrs = [Double]()
    var getAllVolumeDay = [Double]()
    var getAllVolumeMth = [Double]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataName()
        getDataUsd()
        getDataImagem()
        getDataAssetId()
        getDataVolumeHrs()
        getDataVolumeDay()
        getDataVolumeMth()
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
    
    func getDataVolumeHrs() {
        CoinsAPI().getCoins { (coinsArray, erro) in
            if let error = erro {
                print(error)
            }else if let coins = coinsArray{
                self.coins = coins
                for x in 0..<coins.count{
                    let allSingleValue = coins[x]
                    let allVolumeHrs = allSingleValue.volume1HrsUsd
                    self.getAllVolumeHrs.append(allVolumeHrs ?? 0.00)
                }
            }
        }
    }
    
    func getDataVolumeDay() {
        CoinsAPI().getCoins { (coinsArray, erro) in
            if let error = erro {
                print(error)
            }else if let coins = coinsArray{
                self.coins = coins
                for x in 0..<coins.count{
                    let allSingleValue = coins[x]
                    let allVolumeDay = allSingleValue.volume1DayUsd
                    self.getAllVolumeDay.append(allVolumeDay ?? 0.00)
                }
            }
        }
    }
    
    func getDataVolumeMth() {
        CoinsAPI().getCoins { (coinsArray, erro) in
            if let error = erro {
                print(error)
            }else if let coins = coinsArray{
                self.coins = coins
                for x in 0..<coins.count{
                    let allSingleValue = coins[x]
                    let allVolumeMth = allSingleValue.volume1MthUsd
                    self.getAllVolumeMth.append(allVolumeMth ?? 0.00)
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
                //print (self.getAllUrl)
            }
        }
    }
    
    func getDataAssetId() {
        CoinsAPI().getCoins { (coinsArray, erro) in
            if let error = erro {
                print(error)
            }else if let coins = coinsArray{
                self.coins = coins
                for x in 0..<coins.count{
                    let allSingleValue = coins[x]
                    let allAssetId = allSingleValue.assetID
                    self.getAllAssetId.append(allAssetId)
                }
            }
        }
    }
    
    
}
    
    




