//
//  CoinsPrincipalViewController.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 23/01/21.
//

import UIKit

class CoinsPrincipalViewController: UIViewController {
    
    
    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    
    // MARK: - VARIAVEIS DA API, PRECISAM SER REMANEJADAS(MODULO)
    var coins: Welcome = []
    var coins2: Welcome2? = []
    var getAllName = [String]()
    var getAllUsd = [Double]()
    var getAllUrl = [String]()
    var getAllAssetId = [String]()
    var getAllVolumeHrs = [Double]()
    var getAllVolumeDay = [Double]()
    var getAllVolumeMth = [Double]()
    
    private lazy var titleView: UIView = {
        let view = UIView()
        
        view.backgroundColor = blackColor
        return view
    }()

    private lazy var lblCoin: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "Moeda Digital"
        return label
    }()
    
    private lazy var lblDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "4 jan 2020"
        return label
    }()
    
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CoinsPrincipalTableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = blackColor
        table.delegate = self
        table.dataSource = self
        return table
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Moedas"
        getDataName()
        getDataUsd()
        getDataImagem()
        getDataAssetId()
        getDataVolumeHrs()
        getDataVolumeDay()
        getDataVolumeMth()
        setupViewConfiguration()
        
    }
    // MARK: -FUNCOES DA API, PRECISAM SER REMANEJADAS(MODULO)
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
                    self.tableView.reloadData()
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
                    self.tableView.reloadData()
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
                    self.tableView.reloadData()
                }
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
                    self.tableView.reloadData()
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
                    self.tableView.reloadData()
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
                    self.tableView.reloadData()
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
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension CoinsPrincipalViewController: ViewConfiguration{
    func buildViewHierarchy() {
        view.addSubview(titleView)
        titleView.addSubview(lblCoin)
        titleView.addSubview(lblDate)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        titleView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide)
            } else {
                make.top.equalTo(view)
            }
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.height.equalTo(80)
        }
        lblCoin.snp.makeConstraints { (make) in
            make.top.equalTo(titleView).offset(10)
            make.left.equalTo(titleView).offset(10)
            make.right.equalTo(titleView).inset(10)
        }
        
        lblDate.snp.makeConstraints { (make) in
            make.top.equalTo(lblCoin.snp.bottom).offset(8)
            make.left.equalTo(titleView).offset(10)
            make.right.equalTo(titleView).inset(10)
        }
        
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(1)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.bottom.equalTo(view).inset(0)

        }
    }
    
}


extension CoinsPrincipalViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getAllName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoinsPrincipalTableViewCell
        
            cell.backgroundColor = blackColor
        
        //Imagem:
        let imageUrl = URL(string: getAllUrl[indexPath.row])
        cell.imagemCoin.af_setImage(withURL: imageUrl!)
        
        //Label Name:
        cell.lblName.text = getAllName[indexPath.row]
        
        //Label Asset_Id:
        cell.lblID.text = getAllAssetId[indexPath.row]
        
        //Label Value:
        let usd = getAllUsd[indexPath.row]
        let doubleStr = String(format: "%.2f", usd)
        cell.lblValue.text = "$ \(doubleStr)"

            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinSelected = indexPath.item
        let coinsDetailsViewController = CoinsDetailsViewController()
        self.navigationController?.pushViewController(coinsDetailsViewController, animated: true)
        
        //Label Asset_Id:
        coinsDetailsViewController.lblID.text = getAllAssetId[indexPath.row]
        
        //Label Value:
        let usd = getAllUsd[indexPath.row]
        let doubleUsd = String(format: "%.2f", usd)
        coinsDetailsViewController.lblValue.text = "$ \(doubleUsd)"
        
        //Label Volume_ultima_hora:
        let usdLastHour = getAllVolumeHrs[indexPath.row]
        let doubleUsdLastHour = String(format: "%.2f", usdLastHour)
        coinsDetailsViewController.lblLastHourValue.text = "$ \(doubleUsdLastHour)"
        
        //Label Volume_ultimo_dia:
        let usdLastDay = getAllVolumeDay[indexPath.row]
        let doubleUsdLastDay = String(format: "%.2f", usdLastDay)
        coinsDetailsViewController.lblLastMonthValue.text = "$ \(doubleUsdLastDay)"
        
        // Label Volume_ultimo_mes:
        
        let usdLastMth = getAllVolumeMth[indexPath.row]
        let doubleUsdLastMth = String(format: "%.2f", usdLastMth)
        coinsDetailsViewController.lblLastYearValue.text = "$ \(doubleUsdLastMth)"
        
        // Label ImagemCoin:
        let imageUrl = URL(string: getAllUrl[indexPath.row])
        coinsDetailsViewController.imagemCoin.af_setImage(withURL: imageUrl!)
    }
    
    
}
