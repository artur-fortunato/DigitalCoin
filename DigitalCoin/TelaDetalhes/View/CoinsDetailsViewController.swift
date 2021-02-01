//
//  MainViewController.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 21/01/21.
//

import UIKit
import SnapKit
import SDWebImage
import Commons

class CoinsDetailsViewController: UIViewController {

    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    private lazy var coinDetailView: UIView = {
        let view = UIView()
        view.backgroundColor = greenColor
        return view
    }()
    lazy var imagemCoin: UIImageView = {
        let image = UIImageView()
        return image
    }()
    lazy var lblValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "$ 31,600.03"
        return label
    }()
    lazy var buttonAdd: UIButton = {
        let button = UIButton.init(type: .roundedRect)
        button.setTitle("ADICIONAR", for: .normal)
        button.setTitleColor(fontColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .black)
        button.addTarget(self, action: #selector(buttonAddAction), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        if #available(iOS 13.0, *) {
            button.layer.borderColor = CGColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
        } else {
            // Fallback on earlier versions
        }
        return button
    }()
    lazy var tradeView: UIView = {
        let view = UIView()
        view.backgroundColor = blackColor
        return view
    }()
    lazy var tradedVolume: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "volumes negociados"
        return label
    }()
    private lazy var lblLastHour: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "última hora"
        return label
    }()
    lazy var lblLastHourValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "$ 123.456.78"
        return label
    }()
    private lazy var lblLastDay: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "último dia"
        return label
    }()
    lazy var lblLastDayValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "$ 123.456.78"
        return label
    }()
    private lazy var lblLastMonth: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "último mês"
        return label
    }()
    lazy var lblLastMonthValue: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = "$ 123.456.78"
        return label
    }()
    lazy var star: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.textColor = fontColor
        label.text = ""
        return label
    }()
    let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)]

    // MARK: - Properts
    let coinsDetailsViewModel: CoinsDetailsViewModel?
    // MARK: - Constructors
    init(coinsDetailsViewModel: CoinsDetailsViewModel?) {
        self.coinsDetailsViewModel = coinsDetailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonTitleCheck()
        setupViewConfiguration()
        coinDetails()

    }
    func coinDetails() {
        if let valueCoin = coinsDetailsViewModel?.viewData {
            self.imagemCoin.sd_setImage(with: URL(string: valueCoin.idIcon), placeholderImage: UIImage(named: "errorImage.png"))
            self.lblValue.text = valueCoin.priceUsd
            self.lblLastHourValue.text = valueCoin.volume1HrsUsd
            self.lblLastDayValue.text = valueCoin.volume1Day
            self.lblLastMonthValue.text = valueCoin.volume1MthUsd
        }
    }
    func buttonTitleCheck () {
        guard let assetID = coinsDetailsViewModel?.viewData?.assetID else {return}
        if coinsDetailsViewModel?.checkFavorites(assetID) != true {
            buttonAdd.setTitle("ADICIONAR", for: .normal)
            star.text = ""
        } else {
            buttonAdd.setTitle("REMOVER", for: .normal)
            star.text = "★"
        }
    }
    // MARK: - Buttons
    @objc func buttonAddAction(sender: UIButton!) {
        guard let assetID = coinsDetailsViewModel?.viewData?.assetID else {return}
        if coinsDetailsViewModel?.saveFavorites(assetID) != true {
            buttonAdd.setTitle("ADICIONAR", for: .normal)
            star.text = ""
        } else {
            buttonAdd.setTitle("REMOVER", for: .normal)
            star.text = "★"
        }
    }
    override func viewDidAppear(_ animated: Bool) {
    navigationController?.navigationBar.barStyle = .black
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension CoinsDetailsViewController: ViewConfiguration {
    func buildViewHierarchy() {
        view.addSubview(coinDetailView)
        coinDetailView.addSubview(star)
        coinDetailView.addSubview(imagemCoin)
        coinDetailView.addSubview(lblValue)
        coinDetailView.addSubview(buttonAdd)
        view.addSubview(tradeView)
        tradeView.addSubview(tradedVolume)
        tradeView.addSubview(lblLastHour)
        tradeView.addSubview(lblLastHourValue)
        tradeView.addSubview(lblLastDay)
        tradeView.addSubview(lblLastDayValue)
        tradeView.addSubview(lblLastMonth)
        tradeView.addSubview(lblLastMonthValue)
    }
    func setupConstraints() {
        coinDetailView.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(view.safeAreaLayoutGuide)
            } else {
                make.top.equalTo(view)
            }
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.height.equalTo(300)
        }
        star.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(coinDetailView).inset(60)
            make.width.equalTo(60)
        }
        imagemCoin.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.centerX.equalTo(view.center.x)
            make.width.equalTo(60)
        }
        lblValue.snp.makeConstraints { (make) in
            make.top.equalTo(imagemCoin.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
        buttonAdd.snp.makeConstraints { (make) in
            make.top.equalTo(lblValue.snp.bottom).offset(40)
            make.centerX.equalTo(view.center.x)
            make.width.equalTo(300)
            make.height.equalTo(60)
        }
        tradeView.snp.makeConstraints { (make) in
            make.top.equalTo(coinDetailView.snp.bottom).offset(0)
            make.left.equalTo(view).offset(0)
            make.right.equalTo(view).inset(0)
            make.bottom.equalTo(view).offset(0)
        }
        tradedVolume.snp.makeConstraints { (make) in
            make.top.equalTo(tradeView).offset(20)
            make.left.equalTo(tradeView).offset(30)
            make.right.equalTo(tradeView).inset(30)
        }
        lblLastHour.snp.makeConstraints { (make) in
            make.top.equalTo(tradedVolume.snp.bottom).offset(50)
            make.left.equalTo(tradeView).offset(20)

        }
        lblLastHourValue.snp.makeConstraints { (make) in
            make.top.equalTo(tradedVolume.snp.bottom).offset(50)
            make.right.equalTo(tradeView).inset(20)
        }
        lblLastDay.snp.makeConstraints { (make) in
            make.top.equalTo(lblLastHour.snp.bottom).offset(30)
            make.left.equalTo(tradeView).offset(20)
        }
        lblLastDayValue.snp.makeConstraints { (make) in
            make.top.equalTo(lblLastHourValue.snp.bottom).offset(30)
            make.right.equalTo(tradeView).inset(20)
        }
        lblLastMonth.snp.makeConstraints { (make) in
            make.top.equalTo(lblLastDay.snp.bottom).offset(30)
            make.left.equalTo(tradeView).offset(20)
        }
        lblLastMonthValue.snp.makeConstraints { (make) in
            make.top.equalTo(lblLastDayValue.snp.bottom).offset(30)
            make.right.equalTo(tradeView).inset(20)
        }
    }
    func configureViews() {
        view.backgroundColor = .white
        self.title = coinsDetailsViewModel?.viewData?.assetID.uppercased()
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
}
