//
//  FavoritesCollectionViewCell.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 22/01/21.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    
    private lazy var icon: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    lazy var lblName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .light)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "Bitcoin"
        return label
    }()
    
    private lazy var lblID: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.textColor = fontColor
        label.textAlignment = .center
        label.text = "BTC"
        return label
    }()
    
    private lazy var lblValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 23, weight: .light)
        label.textColor = fontColor
        label.textAlignment = .center
        label.text = "$ 31,010.20"
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupViewConfiguration()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesCollectionViewCell: ViewConfiguration{
    func buildViewHierarchy() {
        addSubview(lblName)
        addSubview(lblID)
        addSubview(lblValue)
        addSubview(icon)
    }

    func setupConstraints() {
        
        icon.snp.makeConstraints { (make) in
            make.top.equalTo(-5)
            make.right.equalTo(5)
            make.height.equalTo(30)
            make.width.equalTo(30)

        }
        lblName.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        lblID.snp.makeConstraints { (make) in
            make.top.equalTo(lblName.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)

        }
        
        lblValue.snp.makeConstraints { (make) in
            make.top.equalTo(lblID.snp.bottom).offset(20)
            make.left.equalTo(0)
            make.right.equalTo(0)

        }
    }
}