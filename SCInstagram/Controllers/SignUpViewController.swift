//
//  SignUpViewController.swift
//  SCInstagram
//
//  Created by user on 28.11.2021.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Create new account"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(closeDidTapped))
        
        avatarImageView.layer.cornerRadius = 50
        signUpButton.layer.cornerRadius = 5
        
        avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarDidTapped)))
    }
    
    @objc func closeDidTapped() {
        dismiss(animated: true)
    }
    
    @objc func avatarDidTapped() {
        print("avatar did tapped")
    }

    @IBAction func signUpDidTapped(_ sender: UIButton) {
    }
    
}
