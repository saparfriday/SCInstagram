//
//  InitialViewController.swift
//  SCInstagram
//
//  Created by user on 27.11.2021.
//

import UIKit
import FirebaseAuth

class InitialViewController: UIViewController {
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkAuth()
    }
    
    // MARK: - Methods
    
    func checkAuth() {
        if Auth.auth().currentUser != nil {
            let vc = TabbarController()
            vc.modalPresentationStyle = .fullScreen
            navigationController?.present(vc, animated: true)
        } else {
            let nav = UINavigationController(rootViewController: SignInViewController())
            nav.modalPresentationStyle = .fullScreen
            navigationController?.present(nav, animated: true)
        }
    }

}
