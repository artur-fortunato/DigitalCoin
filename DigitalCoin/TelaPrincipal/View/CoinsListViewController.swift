//
//  CoinsListViewController.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/22/21.
//

import UIKit


class CoinsListViewController: UIViewController {
    
    // MARK - Variaveis

    //var coinstableView = UITableView()
    //var viewModelCoins = CoinsViewModel()
    var coins: Welcome = []
    var coins2: Welcome2 = []
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    
    
    // MARK: Titulo
    
    lazy var coinstableView : UITableView = {
        let tableview = UITableView()
        let nibCoin = UINib(nibName: "TelaPrincipalTableViewCell", bundle: nil)
        tableview.register(nibCoin, forCellReuseIdentifier: "coinCell")
        tableview.delegate = self
        tableview.dataSource = self
        tableview.backgroundColor = blackColor
        return tableview
    }()
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
    
    // MARK: SearchBar
    
    private lazy var searchCoin: UISearchBar = {
       let search = UISearchBar()
        search.barTintColor = blackColor
        search.placeholder = "Coin"
        return search
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        getData()
        getDataImagem()
    }
    func getData() {
        CoinsAPI().getCoins { (coinsArray, erro) in
            if let error = erro {
                print(error)
            }else if let coins = coinsArray{
                self.coins = coins
                self.coinstableView.reloadData()
            }
        }
    }
    func getDataImagem() {
        CoinsAPIImagem().getCoins2 { (coinsArrayImagem, erro) in
            if let error = erro {
                print(error)
            }else if let coinsImagem = coinsArrayImagem{
                self.coins2 = coinsImagem
                self.coinstableView.reloadData()
            }
        }
    }

}



extension CoinsListViewController: ViewConfiguration{
   

    func buildViewHierarchy() {
        view.addSubview(titleView)
        titleView.addSubview(lblCoin)
        titleView.addSubview(lblDate)
        view.addSubview(coinstableView)
        view.addSubview(searchCoin)
        view.addSubview(lineView)

    }
    
    func setupConstraints() {
        
        titleView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            } else {
                make.top.equalTo(view).offset(0)
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
        
        searchCoin.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(0)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.height.equalTo(50)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(searchCoin.snp.bottom).offset(10)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.height.equalTo(1)
        }
   
        coinstableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchCoin.snp.bottom).offset(30)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.bottom.equalTo(view).inset(0)
            //make.height.equalTo(view)
        }
    }

    func configureViews() {
        view.backgroundColor = blackColor
//        let usdFirst = getAllUsd.first
//        let usdFirstString = String(describing: usdFirst)
//        lblValue.text = usdFirstString

    }
}

// MARK: TableDataSource - Coins


extension CoinsListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coins.count + coins2.count - 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let cell = coinstableView.dequeueReusableCell(withIdentifier: "coinCell") as! TelaPrincipalTableViewCell
//          cell.labelnomeMoeda.text = names[indexPath.row]
//          cell.labelSiglaCoin.text = siglas[indexPath.row]
//          cell.labelValorCoin.text = valores[indexPath.row]
       // cell.modelCoins = viewModelCoins.coins[indexPath.row]
        let result = coins[indexPath.row]
        let result2 = coins2[indexPath.row]
        cell.labelnomeMoeda.text = result.name ?? "nil"
        cell.labelSiglaCoin.text = result.assetID ?? "nil"
        
        let formatter4 = NumberFormatter()
        formatter4.maximumFractionDigits = 4
        formatter4.minimumFractionDigits = 4
        
        if let usd  = formatter4.string(for: result.priceUsd){
            cell.labelValorCoin.text = "$ \(usd)"
        }
        
        let imageUrl = URL(string: result2.url ?? "nil")
//        cell.imageSimboloCoin.af_setImage(withURL: imageUrl!)
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinsDetailsViewController = CoinsDetailsViewController()
        self.navigationController?.pushViewController(coinsDetailsViewController, animated: true)
        
        //Setando variaveis indexPath.row
//       let result = coins[indexPath.row]
        let result = coins[indexPath.row]
        let result2 = coins2[indexPath.row]
        
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
        let imageUrl = URL(string: result2.url ?? "nil")
//        coinsDetailsViewController.imagemCoin.af_setImage(withURL: imageUrl!)
    }
}


