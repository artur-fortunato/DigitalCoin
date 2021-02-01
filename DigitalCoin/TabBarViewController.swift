//
//  TabBarViewController.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 24/01/21.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    let greenColor = UIColor(red: 139/255, green: 153/255, blue: 90/255, alpha: 1)
    let fontColor = UIColor(red: 230/255, green: 233/255, blue: 212/255, alpha: 1)
    let blackColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
    var tabBarTag: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.barTintColor = blackColor
        tabBar.isTranslucent = false
        setupNavigationBarAppearance()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        if tabBarTag == true {
            UITabBar.appearance().tintColor = greenColor
        } else {
            UITabBar.appearance().tintColor = fontColor
        }
        let tabOne = CoinsListViewController()
        tabOne.tabBarItem = UITabBarItem(title: "Moedas", image: UIImage(named: "dollar.png"), selectedImage: UIImage(named: "dollar.png"))
        tabOne.coinstableView.reloadData()
        let tabTwo = CoinsFavoritesViewController()
        tabTwo.tabBarItem = UITabBarItem(title: "Adicionadas", image: UIImage(named: "star.png"), selectedImage: UIImage(named: "star.png"))
        let viewControllerList = [tabOne, tabTwo]
        self.viewControllers = viewControllerList      
    }
    func setupNavigationBarAppearance() {
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = greenColor
        if #available(iOS 11.0, *) {
            self.navigationItem.backButtonTitle = "Voltar"
        } else {
            // Fallback on earlier versions
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
