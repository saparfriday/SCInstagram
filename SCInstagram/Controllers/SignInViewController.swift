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
        print("forgot password did tapped")
    }
    
    @IBAction func loginDidTapped(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        print("email: \(email), password: \(password)")
        print("Login in did tapped")
    }
    
    @IBAction func signUpDidTapped(_ sender: UIButton) {
        print("Sign Up did tapped")
    }
    
}
