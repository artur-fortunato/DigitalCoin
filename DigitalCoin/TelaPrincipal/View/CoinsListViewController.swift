//
//  CoinsListViewController.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/22/21.
//

import UIKit

class CoinsListViewController: UIViewController, UISearchBarDelegate {
    // MARK: - Variaveis
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    // MARK: - Titulo
    lazy var coinstableView: UITableView = {
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
        //Formatando a data
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        let month = formatter.string(from: date)
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        label.text = "\(day) \(month) \(year)"
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
    var principalViewModel = CoinsListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        coinstableView.reloadData()
        bind()
        searchCoin.delegate = self
        setupAcessibility()
    }
    func setupAcessibility() {
        lblCoin.accessibilityTraits = .header
        lblCoin.accessibilityValue = "O nome do aplicativo"
        lblDate.accessibilityTraits = .none
        lblDate.accessibilityValue = "O dia de hoje"
        searchCoin.accessibilityTraits = .searchField
        searchCoin.accessibilityValue = "Busca uma moeda digital"
    }
    func bind() {
        principalViewModel.viewData.bind { (_) in
            self.coinstableView.reloadData()
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func searchCoin(_ searchBar: UISearchBar, textDidChange searchText: String) {

        
    }
}

extension CoinsListViewController: ViewConfiguration {
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
        }
    }
    func configureViews() {
        view.backgroundColor = blackColor
    }
}

extension CoinsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return principalViewModel.viewData.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = coinstableView.dequeueReusableCell(withIdentifier: "coinCell") as! TelaPrincipalTableViewCell
        cell.reloadData(coin: principalViewModel.viewData.value[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinSelected =  principalViewModel.viewData.value[indexPath.row]
        let coinsDetailsViewModel = CoinsDetailsViewModel(viewData: coinSelected)
        let coinsDetailsViewController = CoinsDetailsViewController(coinsDetailsViewModel: coinsDetailsViewModel)
        self.navigationController?.pushViewController(coinsDetailsViewController, animated: true)
    }
}
