//
//  InitialViewController.swift
//  SCInstagram
//
//  Created by user on 27.11.2021.
//

import UIKit

class InitialViewController: UIViewController {
    
    var isAuthentication: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if isAuthentication {
            let vc = TabbarController()
            vc.modalPresentationStyle = .fullScreen
            navigationController?.present(vc, animated: true)
        } else {
            let vc = UINavigationController(rootViewController: SignInViewController())
            vc.modalPresentationStyle = .fullScreen
            navigationController?.present(vc, animated: true)
        }
        
        
    }


}

