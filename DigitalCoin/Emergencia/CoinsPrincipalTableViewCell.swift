//
//  FavoritesCollectionViewCell.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 22/01/21.
//

import UIKit

class CoinsPrincipalTableViewCell: UITableViewCell, UISearchBarDelegate {
    
    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    
    
//    private lazy var searchBar: UISearchBar = {
//        let search = UISearchBar()
//        search.searchBarStyle = UISearchBar.Style.prominent
//        search.placeholder = " Search..."
//        search.sizeToFit()
//        search.isTranslucent = false
//        search.backgroundImage = UIImage()
//        search.delegate = self
//        return search
//    }()
    
//    lazy var icon: UIView = {
//        let view = UIView()
//        view.backgroundColor = .orange
//        return view
//    }()
    lazy var imagemCoin: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var lblName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .light)
        label.textColor = fontColor
        label.text = "Bitcoin"
        return label
    }()
    
    lazy var lblID: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = fontColor
        label.text = "BTC"
        return label
    }()

    lazy var lblValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .light)
        label.textColor = fontColor
        label.text = "$ 31,010.20"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: "cell")
        setupViewConfiguration()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CoinsPrincipalTableViewCell: ViewConfiguration{
    func buildViewHierarchy() {
        addSubview(imagemCoin)
        addSubview(lblName)
        addSubview(lblID)
        addSubview(lblValue)
    }

    func setupConstraints() {
        
        imagemCoin.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(20)
            make.height.equalTo(60)
            make.width.equalTo(60)

        }
        
        lblName.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(imagemCoin.snp.right).offset(20)
        }

        lblID.snp.makeConstraints { (make) in
            make.top.equalTo(lblName.snp.bottom).offset(10)
            make.left.equalTo(imagemCoin.snp.right).offset(20)

        }

        lblValue.snp.makeConstraints { (make) in
            make.top.equalTo(30)
            make.right.equalTo(-20)

        }
    }
    
    
}
