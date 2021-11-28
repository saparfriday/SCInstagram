//
//  TabbarController.swift
//  SCInstagram
//
//  Created by user on 28.11.2021.
//

import UIKit

class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavigationController(vc: FeedViewController(), title: "Feed", iconSystemName: "house"),
            createNavigationController(vc: InterestingViewController(), title: "Interesting", iconSystemName: "magnifyingglass"),
            createNavigationController(vc: AddViewController(), title: "Add", iconSystemName: "plus.viewfinder"),
            createNavigationController(vc: ActivitiesViewController(), title: "Activities", iconSystemName: "suit.heart"),
            createNavigationController(vc: ProfileViewController(), title: "Profile", iconSystemName: "person")
        ]
    }
    
    private func createNavigationController(vc: UIViewController, title: String, iconSystemName: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: iconSystemName)
        return navigationController
    }

}
