//
//  TabBarViewController.swift
//  DigitalCoin
//
//  Created by Artur Rodrigues Fortunato on 24/01/21.
//

import UIKit

@available(iOS 13.0, *)
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
       
        if tabBarTag == true{
            UITabBar.appearance().tintColor = greenColor
        }else{
            UITabBar.appearance().tintColor = fontColor
        }
        
        let tabOne = CoinsListViewController()
        tabOne.tabBarItem = UITabBarItem(title: "Moedas", image: UIImage(named: "dollar.png"), selectedImage: UIImage(named: "dollar.png"))
        
        let tabTwo = CoinsFavoritesViewController()
        tabTwo.tabBarItem = UITabBarItem(title: "Adicionadas", image: UIImage(named: "star.png"), selectedImage: UIImage(named: "star.png"))
    
        let viewControllerList = [tabOne, tabTwo]
<<<<<<< HEAD

=======
//        tabOne.tableView.reloadData()
        //tabOne.coinstableView.reloadData()
>>>>>>> acb4933a51835cf557382f687ad900901d8241c1
        
        self.viewControllers = viewControllerList
    
    }
    
    
    func setupNavigationBarAppearance() {
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = blackColor
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent

    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black

    }

}
