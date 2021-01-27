//
//  CoinsListViewController.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/22/21.
//

import UIKit

class CoinsListViewController: UIViewController {
    // MARK - Variaveis
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
    var principalViewModel = CoinsListViewModel()
    var principalImageViewModel = CoinsListImageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        coinstableView.reloadData()
        bind()
    }
    func bind() {
        principalViewModel.viewData.bind { (_) in
            self.coinstableView.reloadData()
        }
        principalImageViewModel.viewDataImage.bind { (_) in
            self.coinstableView.reloadData()
        }
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
        return principalViewModel.viewData.value.count + principalImageViewModel.viewDataImage.value.count - 13
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = coinstableView.dequeueReusableCell(withIdentifier: "coinCell") as! TelaPrincipalTableViewCell
        cell.reloadData(coin: principalViewModel.viewData.value[indexPath.row])
        cell.reloadDataImage(coinImage: principalImageViewModel.viewDataImage.value[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coinsDetailsViewController = CoinsDetailsViewController()
        self.navigationController?.pushViewController(coinsDetailsViewController, animated: true)
    }
}
