//
//  TelaPrincipalTableViewCell.swift
//  DigitalCoin
//
//  Created by Fabricio Rodrigo Baixo on 1/21/21.
//

import UIKit

class TelaPrincipalTableViewCell: UITableViewCell {

    @IBOutlet weak var imageSimboloCoin: UIImageView!
    @IBOutlet weak var labelnomeMoeda: UILabel!
    
    @IBOutlet weak var labelSiglaCoin: UILabel!
    @IBOutlet weak var labelValorCoin: UILabel!
    
    var modelCoins: CoinsModel?{
        didSet{
            userConfiguration()
        }
    }
    
    // MARK - Inicializadores
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK - Func
    
    func userConfiguration(){
        guard let name = modelCoins?.name else{return}
        guard let sigla = modelCoins?.id else{return}
        guard let usd = modelCoins?.priceUsd else{return}
        let usdFormatado = formatNumberToDecimal(value: usd)
        
        labelnomeMoeda.text = modelCoins?.name ?? ""
        labelSiglaCoin.text = sigla
        labelValorCoin.text = usdFormatado
        
    }
    
    func formatNumberToDecimal (value:Double) -> String{
        let numformatado = NumberFormatter()
        
        numformatado.minimumFractionDigits = 2
        numformatado.numberStyle = .decimal
        
        return numformatado.string(from: NSNumber(value:value)) ?? "00"
    }
}
