//
//  ForgotPasswordViewController.swift
//  SCInstagram
//
//  Created by user on 28.11.2021.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var recoverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Recover password"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(closeDidTapped))
        recoverButton.layer.cornerRadius = 5
    }
    
    @objc func closeDidTapped() {
        dismiss(animated: true)
    }
    
    @IBAction func recoverDidTapped(_ sender: UIButton) {
        print("recover did tapped")
    }
    
}
