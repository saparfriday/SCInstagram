//
//  InitialViewController.swift
//  SCInstagram
//
//  Created by user on 27.11.2021.
//

import UIKit
import FirebaseAuth

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkAuth()
        view.backgroundColor = .red
    }
    
    func checkAuth() {
        if Auth.auth().currentUser != nil {
            let vc = TabbarController()
            vc.modalPresentationStyle = .fullScreen
            navigationController?.present(vc, animated: true)
        } else {
            let vc = SignInViewController()
            vc.delegate = self
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            navigationController?.present(nav, animated: true)
        }
    }

}

extension InitialViewController: SignInDelegate {
    
    func signSuccessfully() {
        checkAuth()
    }
    
}
