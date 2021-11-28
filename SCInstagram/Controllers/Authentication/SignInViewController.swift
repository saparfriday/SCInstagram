//
//  SignInViewController.swift
//  SCInstagram
//
//  Created by user on 28.11.2021.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
    }

    @IBAction func forgotPasswordDidTapped(_ sender: UIButton) {
        let vc = UINavigationController(rootViewController: ForgotPasswordViewController())
        navigationController?.present(vc, animated: true)
    }
    
    @IBAction func loginDidTapped(_ sender: UIButton) {
    }
    
    @IBAction func signUpDidTapped(_ sender: UIButton) {
        let vc = UINavigationController(rootViewController: SignUpViewController())
        navigationController?.present(vc, animated: true)
    }
    
}
