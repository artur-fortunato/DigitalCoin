//
//  CoinsListViewController.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/22/21.
//

import UIKit

@available(iOS 13.0, *)
class CoinsListViewController: UIViewController, UITableViewDelegate {
    
    // MARK - Variaveis

    var coinstableView = UITableView()
    var viewModelCoins = CoinsViewModel()
    
    // MARK: Titulo
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var lblCoin: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.text = "Moeda Digital"
        return label
    }()
    
    private lazy var lblDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.textColor = .lightGray
        label.text = "4 jan 2020"
        return label
    }()
    
    // MARK: SearchBar
    
    private lazy var searchCoin: UISearchBar = {
       let search = UISearchBar()
        search.barTintColor = .black
        search.placeholder = "Coin"
        return search
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    // MARK - TableView
    
    func coinList(){
        let nibCoin = UINib(nibName: "TelaPrincipalTableViewCell", bundle: nil)
        coinstableView.register(nibCoin, forCellReuseIdentifier: "coinCell")
        coinstableView.delegate = self
        coinstableView.dataSource = self
       
        viewModelCoins.cl = self
        viewModelCoins.alamoCoinsList()
    }
    
    
    // MARK: - Inicializadores
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        coinList()
    }
}


@available(iOS 13.0, *)
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
            make.height.equalTo(view)
        }
    }

    func configureViews() {
        view.backgroundColor = .black
//        let usdFirst = getAllUsd.first
//        let usdFirstString = String(describing: usdFirst)
//        lblValue.text = usdFirstString

    }
}

// MARK: TableDataSource - Coins

@available(iOS 13.0, *)
extension CoinsListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelCoins.coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let cell = coinstableView.dequeueReusableCell(withIdentifier: "coinCell") as! TelaPrincipalTableViewCell
//          cell.labelnomeMoeda.text = names[indexPath.row]
//          cell.labelSiglaCoin.text = siglas[indexPath.row]
//          cell.labelValorCoin.text = valores[indexPath.row]
        cell.modelCoins = viewModelCoins.coins[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinsDetailsViewController = CoinsDetailsViewController()
        self.navigationController?.pushViewController(coinsDetailsViewController, animated: true)
        
        //Setando variaveis indexPath.row
//       let result = coins[indexPath.row]
        let result = viewModelCoins.coins[indexPath.row]
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
        if let usdLastHour = formatter2.string(for: result.lastHour){
            coinsDetailsViewController.lblLastHourValue.text = "$ \(usdLastHour)"
        }
        
        //Setando Volume_ultimo_dia:
        if let usdLastDay = formatter2.string(for: result.lastDay){
            coinsDetailsViewController.lblLastMonthValue.text = "$ \(usdLastDay)"
        }
        
        //Setando Label Volume_ultimo_mes:
        
        if let usdLastMth = formatter2.string(for: result.lastMonth){
            coinsDetailsViewController.lblLastYearValue.text = "$ \(usdLastMth)"
        }
        
        //Setando Label ImagemCoin:
        //let imageUrl = URL(string: result2.url ?? "nil")
        //coinsDetailsViewController.imagemCoin.af_setImage(withURL: imageUrl!)
    }
}


