//
//  ErroAPI.swift
//  DigitalCoin
//
//  Created by Aloisio Formento Junior on 29/01/21.
//

import UIKit

class ErroAPI: NSObject {

    func erroAlert(title: String, message: String) {
        let viewController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        let alert = UIAlertController(title: title, message: "\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "tentar novamente", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
