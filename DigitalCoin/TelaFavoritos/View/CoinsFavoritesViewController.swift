//
//  CoinsFavoritesViewController.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 22/01/21.
//

import UIKit

class CoinsFavoritesViewController: UIViewController {

    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    
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
        // Formatando a Data
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
    private lazy var lineWhite: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        return label
    }()
    private lazy var favoritesView: UIView = {
        let view = UIView()
        view.backgroundColor = blackColor
        return view
    }()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FavoritesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = blackColor
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    private lazy var collectionViewCell: UICollectionViewCell = {
        let cvc = UICollectionViewCell()
        return cvc
    }()
    let coinsFavoritesViewModel: CoinsFavoritesViewModel = CoinsFavoritesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Adicionadas"
        setupViewConfiguration()
        coinsFavoritesViewModel.loadCoin()
        collectionView.reloadData()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension CoinsFavoritesViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(titleView)
        titleView.addSubview(lblCoin)
        titleView.addSubview(lblDate)
        view.addSubview(lineWhite)
        view.addSubview(favoritesView)
        favoritesView.addSubview(collectionView)
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
        favoritesView.snp.makeConstraints { (make) in
            make.top.equalTo(lineWhite.snp.bottom).offset(0)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.bottom.equalTo(view).inset(0)
        }
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(favoritesView).offset(20)
            make.left.equalTo(favoritesView).offset(30)
            make.right.equalTo(favoritesView).inset(30)
            make.bottom.equalTo(favoritesView).inset(10)
        }
    }
    func configureViews() {
        view.backgroundColor = blackColor
    }
}

extension CoinsFavoritesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.2, height: collectionView.frame.width/2.5)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coinsFavoritesViewModel.arrayCoin.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FavoritesCollectionViewCell
        cell.configureCell(coin: (coinsFavoritesViewModel.arrayCoin[indexPath.item]))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let coinsDetailsViewController = CoinsDetailsViewController(coinsDetailsViewModel)
//        self.navigationController?.pushViewController(coinsDetailsViewController, animated: true)
    }
}
