//
//  MainViewController.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 21/01/21.
//

import UIKit
import SnapKit

class CoinsDetailsViewController: UIViewController {

    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    
    
    var coins: Welcome? = []
    var getAllUsd = [Double]()
    
    
    
    private lazy var coinDetailView: UIView = {
        let view = UIView()
        
        view.backgroundColor = greenColor
        return view
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton.init(type: .roundedRect)
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(fontColor, for: .normal)
        button.addTarget(self, action: #selector(buttonBackAction), for: .touchUpInside)

        let backButtonImage = UIImage(named: "backbutton")?.withRenderingMode(.alwaysTemplate)
        button.setImage(backButtonImage, for: .normal)
        
        return button
    }()
    
    lazy var lblID: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "ID"
        return label
    }()
    
//    lazy var icon: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        return view
//    }()
    lazy var imagemCoin: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    
    lazy var lblValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "$ 31,600.03"
        return label
    }()
    
    lazy var buttonAdd: UIButton = {
        let button = UIButton.init(type: .roundedRect)
        button.setTitle("ADICIONAR", for: .normal)
        button.setTitleColor(fontColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize:20, weight: .black)
        button.addTarget(self, action: #selector(buttonAddAction), for: .touchUpInside)
        
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        if #available(iOS 13.0, *) {
            button.layer.borderColor = CGColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
        } else {
            //
        }
        
        return button
    }()
    
    lazy var tradeView: UIView = {
        let view = UIView()
        view.backgroundColor = blackColor
        
        return view
    }()
    
    lazy var tradedVolume: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "volumes negociados"
        return label
    }()
    
    private lazy var lblLastHour: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "última hora:"
        return label
    }()
    
    lazy var lblLastHourValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "$ 123.456.78"
        return label
    }()
    
    private lazy var lblLastMonth: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "último dia:"
        return label
    }()
    
    lazy var lblLastMonthValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "$ 123.456.78"
        return label
    }()
    
    private lazy var lblLastYear: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "último mês:"
        return label
    }()
    
    lazy var lblLastYearValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "$ 123.456.78"
        return label
    }()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Details"
        //getDataUsd()
        setupViewConfiguration()
        
    }
    
    
    //MARK:- Buttons
    
    @objc func buttonBackAction(sender: UIButton!) {
        if let navigation = navigationController{
            navigation.popViewController(animated: true)
            
        }
    }
    
    @objc func buttonAddAction(sender: UIButton!){
        print("Adicionar")
    }
    
//    func getDataUsd() {
//        CoinsAPI().getCoins { (coinsArray, erro) in
//            if let error = erro {
//                print(error)
//            }else if let coins = coinsArray{
//                self.coins = coins
//                for x in 0..<coins.count{
//                    let allSingleValue = coins[x]
//                    let allUsd = allSingleValue.priceUsd
//                    self.getAllUsd.append(allUsd ?? 0.00)
//                }
//            }
//            print(self.getAllUsd)
//        }
//    }

}





extension CoinsDetailsViewController: ViewConfiguration{
   

    func buildViewHierarchy() {

        view.addSubview(coinDetailView)
        coinDetailView.addSubview(buttonBack)
        coinDetailView.addSubview(lblID)
        coinDetailView.addSubview(imagemCoin)
        coinDetailView.addSubview(lblValue)
        coinDetailView.addSubview(buttonAdd)
        view.addSubview(tradeView)
        tradeView.addSubview(tradedVolume)
        tradeView.addSubview(lblLastHour)
        tradeView.addSubview(lblLastHourValue)
        tradeView.addSubview(lblLastMonth)
        tradeView.addSubview(lblLastMonthValue)
        tradeView.addSubview(lblLastYear)
        tradeView.addSubview(lblLastYearValue)
    }
    
    func setupConstraints() {
        
        coinDetailView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide)
            } else {
                make.top.equalTo(view)
            }
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.height.equalTo(300)
        }
        
        buttonBack.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide)
            } else {
                make.top.equalTo(view)
            }
            make.left.equalTo(view).offset(8)
        }
        
        lblID.snp.makeConstraints { (make) in
            make.top.equalTo(coinDetailView).offset(20)
            make.left.equalTo(coinDetailView).offset(10)
            make.right.equalTo(coinDetailView).inset(10)
        }
            
        imagemCoin.snp.makeConstraints { (make) in
            make.top.equalTo(lblID.snp.bottom).offset(20)
            make.left.equalTo(coinDetailView).offset(170)
            make.right.equalTo(coinDetailView).inset(170)

            make.height.equalTo(30)
        }
        
        lblValue.snp.makeConstraints { (make) in
            make.top.equalTo(imagemCoin.snp.bottom).offset(20)
            make.left.equalTo(coinDetailView).offset(10)
            make.right.equalTo(coinDetailView).inset(10)

        }
       
        buttonAdd.snp.makeConstraints { (make) in
            make.top.equalTo(lblValue.snp.bottom).offset(30)
            make.left.equalTo(coinDetailView).offset(80)
            make.right.equalTo(coinDetailView).inset(80)
            make.height.equalTo(40)
        }
        
        tradeView.snp.makeConstraints { (make) in
            make.top.equalTo(coinDetailView.snp.bottom).offset(0)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.bottom.equalTo(view).offset(0)
        }
        
        tradedVolume.snp.makeConstraints { (make) in
            make.top.equalTo(tradeView).offset(20)
            make.left.equalTo(tradeView).offset(30)
            make.right.equalTo(tradeView).inset(30)
        }
        
        lblLastHour.snp.makeConstraints { (make) in
            make.top.equalTo(tradedVolume.snp.bottom).offset(50)
            make.left.equalTo(tradeView).offset(20)

        }
        
        lblLastHourValue.snp.makeConstraints { (make) in
            make.top.equalTo(tradedVolume.snp.bottom).offset(50)
            make.right.equalTo(tradeView).inset(20)
        }
        
        lblLastMonth.snp.makeConstraints { (make) in
            make.top.equalTo(lblLastHour.snp.bottom).offset(30)
            make.left.equalTo(tradeView).offset(20)

        }
        
        lblLastMonthValue.snp.makeConstraints { (make) in
            make.top.equalTo(lblLastHourValue.snp.bottom).offset(30)
            make.right.equalTo(tradeView).inset(20)
        }
        
        lblLastYear.snp.makeConstraints { (make) in
            make.top.equalTo(lblLastMonth.snp.bottom).offset(30)
            make.left.equalTo(tradeView).offset(20)

        }
        
        lblLastYearValue.snp.makeConstraints { (make) in
            make.top.equalTo(lblLastMonthValue.snp.bottom).offset(30)
            make.right.equalTo(tradeView).inset(20)
        }
    }

    func configureViews() {
        view.backgroundColor = .white
//        let usdFirst = getAllUsd.first
//        let usdFirstString = String(describing: usdFirst)
//        lblValue.text = usdFirstString
        
    }
}
