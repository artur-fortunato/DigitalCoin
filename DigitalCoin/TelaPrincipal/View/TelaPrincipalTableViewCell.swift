//
//  TelaPrincipalTableViewCell.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/21/21.
//

import UIKit
import AlamofireImage

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
    }
}

extension TelaPrincipalTableViewCell: CoinsListImageViewModelDelegate{
    func reloadDataImage(coinImage: CoinsListImageViewData) {
        let image = coinImage.image
        if let urlImage = URL(string: "\(image)")
            {
            self.imageSimboloCoin.af_setImage(withURL: urlImage)
            self.imageSimboloCoin.layer.cornerRadius = 10
            self.imageSimboloCoin.layer.masksToBounds = true
            }
        else{
            print("error")
        }
    }
    
    
}
