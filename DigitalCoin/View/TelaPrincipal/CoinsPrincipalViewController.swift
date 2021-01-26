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
    var coins2: Welcome2 = []
    
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
    
    private lazy var lineWhite: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        return label
    }()
    
    lazy var tableView: UITableView = {
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
        getData()
        getDataImagem()
        setupViewConfiguration()
    }
    // MARK: - Funçoes das API`S Precisam ir para MODULO
    func getData() {
        CoinsAPI().getCoins { (coinsArray, erro) in
            if let error = erro {
                print(error)
            }else if let coins = coinsArray{
                self.coins = coins
                self.tableView.reloadData()
            }
        }
    }
    
    func getDataImagem() {
        CoinsAPIImagem().getCoins2 { (coinsArrayImagem, erro) in
            if let error = erro {
                print(error)
            }else if let coinsImagem = coinsArrayImagem{
                self.coins2 = coinsImagem
                self.tableView.reloadData()
            }
        }
    }
}

extension CoinsPrincipalViewController: ViewConfiguration{
    func buildViewHierarchy() {
        view.addSubview(titleView)
        titleView.addSubview(lblCoin)
        titleView.addSubview(lblDate)
        view.addSubview(lineWhite)
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
        
        lineWhite.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(0)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.height.equalTo(1)
        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(lineWhite.snp.bottom).offset(1)
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
        return coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoinsPrincipalTableViewCell
        
        //Setando variaveis indexPath.row
        let result = coins[indexPath.row]
        //let result2 = coins2[indexPath.row]
        
        //Setando label nome da moeda
        cell.lblName.text = result.name ?? "nil"
        
        //Setando label sigla da moeda
        cell.lblID.text = result.assetID ?? "nil"
        
        //Setando label valor da moeda em USD
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 4
        formatter.minimumFractionDigits = 4
        if let usdString = formatter.string(for: result.priceUsd){
            cell.lblValue.text = "$ \(usdString)"
        }
        
        //Setando icone da moeda
        //let imageUrl = URL(string: result2.url ?? "nil")
        //cell.imagemCoin.af_setImage(withURL: imageUrl!)
        
        cell.backgroundColor = blackColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinsDetailsViewController = CoinsDetailsViewController()
        self.navigationController?.pushViewController(coinsDetailsViewController, animated: true)
        
        //Setando variaveis indexPath.row
        let result = coins[indexPath.row]
        //let result2 = coins2[indexPath.row]
        
        //Setando Label Asset_Id:
        coinsDetailsViewController.lblID.text = result.name ?? "nil"
        
        //Setando Label Value:
        let formatter4 = NumberFormatter()
        formatter4.maximumFractionDigits = 4
        formatter4.minimumFractionDigits = 4
        if let usd  = formatter4.string(for: result.priceUsd){
            coinsDetailsViewController.lblValue.text = "$ \(usd)"
        }
        
        //Setando Label Volume_ultima_hora:
        let formatter2 = NumberFormatter()
        formatter2.maximumFractionDigits = 2
        formatter2.minimumFractionDigits = 2
        if let usdLastHour = formatter2.string(for: result.volume1HrsUsd){
            coinsDetailsViewController.lblLastHourValue.text = "$ \(usdLastHour)"
        }
        
        //Setando Volume_ultimo_dia:
        if let usdLastDay = formatter2.string(for: result.volume1DayUsd){
            coinsDetailsViewController.lblLastMonthValue.text = "$ \(usdLastDay)"
        }
        
        //Setando Label Volume_ultimo_mes:
        
        if let usdLastMth = formatter2.string(for: result.volume1MthUsd){
            coinsDetailsViewController.lblLastYearValue.text = "$ \(usdLastMth)"
        }
        
        //Setando Label ImagemCoin:
        //let imageUrl = URL(string: result2.url ?? "nil")
        //coinsDetailsViewController.imagemCoin.af_setImage(withURL: imageUrl!)
    }
    
    
}
