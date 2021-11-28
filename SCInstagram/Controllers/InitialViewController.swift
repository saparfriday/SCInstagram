//
//  InitialViewController.swift
//  SCInstagram
//
//  Created by user on 27.11.2021.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let vc = UINavigationController(rootViewController: SignInViewController())
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true)
    }


}

