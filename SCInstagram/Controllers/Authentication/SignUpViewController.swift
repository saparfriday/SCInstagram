//
//  SignUpViewController.swift
//  SCInstagram
//
//  Created by user on 28.11.2021.
//

import UIKit
import FirebaseAuth

protocol SignUpDelegate: AnyObject {
    func signUpSuccessfully()
}

class SignUpViewController: UIViewController {
    
    // MARK: - Data
    
    weak var delegate: SignUpDelegate?
    
    // MARK: - Views

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Create new account"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(closeDidTapped))
        
        avatarImageView.layer.cornerRadius = 50
        signUpButton.layer.cornerRadius = 5
        
        avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarDidTapped)))
    }
    
    // MARK: - Actions
    
    @objc func closeDidTapped() {
        dismiss(animated: true)
    }
    
    @objc func avatarDidTapped() {
        print("avatar did tapped")
    }

    @IBAction func signUpDidTapped(_ sender: UIButton) {
        guard let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            self.dismiss(animated: true) {
                self.delegate?.signUpSuccessfully()
            }
        }
    }
    
}
