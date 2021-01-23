////
////  MainViewModel.swift
////  DigitalCoin
////
////  Created by Artur Rodrigues Fortunato on 22/01/21.
////
//
//import Foundation
//
//protocol MainViewModelDelegate {
//    func reloadData(coin: CoinsViewData)
//}
//
//
//class MainViewModel{
//    private let client: CoinsServiceProtocol
//    var viewData: Bindable<CoinsViewData?> = Bindable(nil)
//    var delegate: MainViewModelDelegate?
//    
//    init(client: CoinsServiceProtocol = CoinService()) {
//        self.client = client
//    }
//    
//    func loadCoin(){
//        client.getCoin { (coin) in
//            self.delegate?.reloadData(coin: CoinsViewData(model: coin))
//        }
//    }
//}
