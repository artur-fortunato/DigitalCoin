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
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
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
