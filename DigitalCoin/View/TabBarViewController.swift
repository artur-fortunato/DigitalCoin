//
//  TabBarViewController.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 24/01/21.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tabOne = CoinsPrincipalViewController()
        tabOne.tabBarItem = UITabBarItem(title: "Moedas", image: UIImage(named: "dollar.png"), selectedImage: UIImage(named: "dollar.png"))
        
        let tabTwo = CoinsFavoritesViewController()
        tabTwo.tabBarItem = UITabBarItem(title: "Adicionadas", image: UIImage(named: "star.png"), selectedImage: UIImage(named: "star.png"))
    
        let viewControllerList = [tabOne, tabTwo]
        tabOne.tableView.reloadData()
        
        self.viewControllers = viewControllerList
    
    }
    

}
