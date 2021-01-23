////
////  CoinsPrincipalViewController.swift
////  DigitalCoin
////
////  Created by Artur Rodrigues Fortunato on 23/01/21.
////
//
//import UIKit
//
//class CoinsPrincipalViewController: UIViewController {
//    
//    
//    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
//    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
//    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
//    
//    
//    private lazy var titleView: UIView = {
//        let view = UIView()
//        
//        view.backgroundColor = blackColor
//        return view
//    }()
//
//    private lazy var lblCoin: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
//        label.textAlignment = .center
//        label.textColor = fontColor
//        label.text = "Moeda Digital"
//        return label
//    }()
//    
//    private lazy var lblDate: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        label.textAlignment = .center
//        label.textColor = fontColor
//        label.text = "4 jan 2020"
//        return label
//    }()
//    
//    private lazy var favoritesView: UIView = {
//        let view = UIView()
//        
//        view.backgroundColor = blackColor
//        return view
//    }()
//    
//    
//    private lazy var tableView: UITableView = {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.backgroundColor = greenColor
//        table.register(CoinsTableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupViewConfiguration()
//    }
//}
//
//extension CoinsPrincipalViewController: ViewConfiguration{
//    func buildViewHierarchy() {
//        view.addSubview(titleView)
//        titleView.addSubview(lblCoin)
//        titleView.addSubview(lblDate)
//        view.addSubview(favoritesView)
//        favoritesView.addSubview(tableView)
//    }
//    
//    func setupConstraints() {
//        titleView.snp.makeConstraints { (make) in
//            if #available(iOS 11.0, *) {
//                make.top.equalTo(view.safeAreaLayoutGuide)
//            } else {
//                make.top.equalTo(view)
//            }
//            make.left.equalTo(view).offset(0)
//            make.right.equalTo(view).inset(0)
//            make.height.equalTo(80)
//        }
//        lblCoin.snp.makeConstraints { (make) in
//            make.top.equalTo(titleView).offset(10)
//            make.left.equalTo(titleView).offset(10)
//            make.right.equalTo(titleView).inset(10)
//        }
//        
//        lblDate.snp.makeConstraints { (make) in
//            make.top.equalTo(lblCoin.snp.bottom).offset(8)
//            make.left.equalTo(titleView).offset(10)
//            make.right.equalTo(titleView).inset(10)
//        }
//        
//        favoritesView.snp.makeConstraints { (make) in
//            make.top.equalTo(titleView.snp.bottom).offset(1)
//            make.left.equalTo(view).offset(0)
//            make.right.equalTo(view).inset(0)
//            make.bottom.equalTo(view).inset(0)
//        }
//        
//        tableView.snp.makeConstraints { (make) in
//            make.top.equalTo(favoritesView).offset(1)
//            make.left.equalTo(favoritesView).offset(0)
//            make.right.equalTo(favoritesView).inset(0)
//            make.bottom.equalTo(favoritesView).inset(0)
//        }
//    }
//    
//    func configureViews() {
//        view.backgroundColor = blackColor
//        
//    }
//    
//}
//
//
//extension CoinsPrincipalViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoinsTableViewCell
////            cell.textLabel?.text = characters[indexPath.row]
//
//            return cell
//    }
//    
//    
//}
