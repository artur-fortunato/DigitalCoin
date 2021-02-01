//
//  CoinFavoritesCollectionViewCell.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 01/02/21.
//

import UIKit
import SDWebImage
import Commons

class CoinsFavoritesCollectionViewCell: UICollectionViewCell {
    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    private lazy var cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = greenColor
        return view
    }()
    private lazy var icon: UIImageView = {
        let view = UIImageView()
        return view
    }()
    lazy var lblName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "Bitcoin"
        return label
    }()
    private lazy var lblID: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = fontColor
        label.textAlignment = .center
        label.text = "BTC"
        return label
    }()
    private lazy var lblValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .light)
        label.textColor = fontColor
        label.textAlignment = .center
        label.text = "$ 31,010.20"
        return label
    }()
    var coinsFavoritesCellViewModel = CoinsFavoritesCellViewModel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewConfiguration()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureCell(coin: CoinsViewData) {
        coinsFavoritesCellViewModel.loadCoin(viewData: coin)
        setarCell()
    }
    func setarCell() {
        guard let setarCell = coinsFavoritesCellViewModel.viewData.value else {return}
        if setarCell.favorites {
            lblID.text = setarCell.assetID
            lblName.text = setarCell.name
            lblValue.text = setarCell.priceUsd
            icon.sd_setImage(with: URL(string: setarCell.idIcon), placeholderImage: UIImage(named: "errorImage.png"))
            icon.layer.cornerRadius = 10
            icon.layer.masksToBounds = true
        }
        
    }
    
}

extension CoinsFavoritesCollectionViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(cellView)
        cellView.addSubview(lblName)
        cellView.addSubview(lblID)
        cellView.addSubview(lblValue)
        cellView.addSubview(icon)
    }
    func setupConstraints() {
        cellView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).inset(10)
            make.left.equalTo(contentView).offset(10)
            make.bottom.equalTo(contentView).inset(10)
        }
        icon.snp.makeConstraints { (make) in
            make.top.equalTo(cellView).offset(-10)
            make.right.equalTo(cellView).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        lblName.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        lblID.snp.makeConstraints { (make) in
            make.top.equalTo(lblName.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        lblValue.snp.makeConstraints { (make) in
            make.top.equalTo(lblID.snp.bottom).offset(25)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
    }
}
