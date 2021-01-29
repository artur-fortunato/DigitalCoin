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
    // MARK - Inicializadores
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAcessibility()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setupAcessibility(){
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

extension TelaPrincipalTableViewCell: CoinsListViewModelDelegate {
    func reloadData(coin: CoinsListViewData) {
        self.labelnomeMoeda.text = coin.name
        self.labelSiglaCoin.text = coin.assetID
        self.labelValorCoin.text = coin.priceUsd
        self.imageSimboloCoin.sd_setImage(with: URL(string: coin.idIcon), placeholderImage: UIImage(named: "errorImage.png"))
        self.imageSimboloCoin.layer.cornerRadius = 10
        self.imageSimboloCoin.layer.masksToBounds = true
    }
}
