//
//  FavoritesCollectionViewCell.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 22/01/21.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleView: UIView = {
        let view = UIView()

        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var icon: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
//        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesCollectionViewCell: ViewConfiguration{
    func buildViewHierarchy() {
        addSubview(titleView)
        titleView.addSubview(icon)
    }

    func setupConstraints() {
        titleView.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.bottom).offset(0)
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).inset(10)
            make.bottom.equalTo(contentView).offset(10)
        }

        icon.snp.makeConstraints { (make) in
            make.top.equalTo(titleView.snp.bottom).offset(0)
            make.right.equalTo(titleView).inset(0)
            make.height.equalTo(50)
        }
    }
    
    
}
