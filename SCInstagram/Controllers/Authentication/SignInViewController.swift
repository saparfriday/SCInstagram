//
//  SignInViewController.swift
//  SCInstagram
//
//  Created by user on 28.11.2021.
//

import UIKit

protocol SignInDelegate: AnyObject {
    func signSuccessfully()
}

class SignInViewController: UIViewController {
    
    // MARK: - Data
    
    weak var delegate: SignInDelegate?
    
    // MARK: - Views

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
    }
    
    // MARK: - Actions

    @IBAction func forgotPasswordDidTapped(_ sender: UIButton) {
        let vc = UINavigationController(rootViewController: ForgotPasswordViewController())
        navigationController?.present(vc, animated: true)
    }
    
    @IBAction func loginDidTapped(_ sender: UIButton) {
    }
    
    @IBAction func signUpDidTapped(_ sender: UIButton) {
        let vc = SignUpViewController()
        vc.delegate = self
        let nav = UINavigationController(rootViewController: vc)
        navigationController?.present(nav, animated: true)
    }
    
}

// MARK: - Sign Up Delegate

extension SignInViewController: SignUpDelegate {
    
    func signUpSuccessfully() {
        dismiss(animated: true) {
            self.delegate?.signSuccessfully()
        }
    }
    
}
