//
//  TelaPrincipalTableViewCell.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/21/21.
//

import UIKit
import SDWebImage

class TelaPrincipalTableViewCell: UITableViewCell {

    @IBOutlet weak var imageSimboloCoin: UIImageView!
    @IBOutlet weak var labelnomeMoeda: UILabel!
    @IBOutlet weak var labelSiglaCoin: UILabel!
    @IBOutlet weak var labelValorCoin: UILabel!
    var telaPrincipalTableCellViewModel = TelaPrincipalTableCellViewModel()
    // MARK: - Inicializadores
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAcessibility()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func configureCell(coin: CoinsViewData) {
        telaPrincipalTableCellViewModel.loadCoin(viewData: coin)
        bind()
    }
    func bind() {
        guard let setarCell = telaPrincipalTableCellViewModel.viewData.value else {return}
        if setarCell.favorites {
            labelnomeMoeda.text = setarCell.name + " ★"
        } else {
            labelnomeMoeda.text = setarCell.name
        }
        labelSiglaCoin.text = setarCell.assetID
        labelValorCoin.text = setarCell.priceUsd
        imageSimboloCoin.sd_setImage(with: URL(string: setarCell.idIcon), placeholderImage: UIImage(named: "errorImage.png"))
        imageSimboloCoin.layer.cornerRadius = 10
        imageSimboloCoin.layer.masksToBounds = true
    }
    func setupAcessibility() {
        labelnomeMoeda.isAccessibilityElement = true
        labelnomeMoeda.accessibilityTraits = .none
        labelnomeMoeda.accessibilityValue = "O nome da moeda digital"
        labelSiglaCoin.isAccessibilityElement = true
        labelSiglaCoin.accessibilityTraits = .none
        labelSiglaCoin.accessibilityValue = "A sigla da moeda"
        labelValorCoin.isAccessibilityElement = true
        labelValorCoin.accessibilityTraits = .none
        labelValorCoin.accessibilityValue = "cents, o valor em dólares de uma unidade da moeda"
        self.accessibilityElements = [labelnomeMoeda,labelSiglaCoin,labelValorCoin]
    }
}
