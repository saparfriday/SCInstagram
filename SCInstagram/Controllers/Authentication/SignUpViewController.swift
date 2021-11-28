//
//  SignUpViewController.swift
//  SCInstagram
//
//  Created by user on 28.11.2021.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol SignUpDelegate: AnyObject {
    func signUpSuccessfully()
}

class SignUpViewController: UIViewController {
    
    // MARK: - Data
    
    weak var delegate: SignUpDelegate?
    
    private var image: UIImage?
    
    // MARK: - Views

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    private lazy var pickerController: UIImagePickerController = {
        let controller = UIImagePickerController()
        controller.allowsEditing = true
        controller.delegate = self
        return controller
    }()
    
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
        presentAlert()
    }

    @IBAction func signUpDidTapped(_ sender: UIButton) {
        
        guard let image = image, let compressedImage = image.jpegData(compressionQuality: 0.4) else {
            print("You must to load avatar")
            return
        }
        
        guard let username = usernameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let authData = authResult else { return }
            
            self.saveAvatar(uid: authData.user.uid, imageData: compressedImage) { avatarURL in
                let user = User(uid: authData.user.uid, username: username, email: email, avatarURL: avatarURL)
                self.saveUserInFirestore(user)
            }
        }
    }
    
    // MARK: - Methods
    
    private func saveUserInFirestore(_ user: User) {
        do {
            try Firestore.firestore().collection("users").document(user.uid).setData(from: user)
            self.dismiss(animated: true) {
                self.delegate?.signUpSuccessfully()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func presentAlert() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.pickerController.sourceType = .camera
            self.navigationController?.present(self.pickerController, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.pickerController.sourceType = .photoLibrary
            self.navigationController?.present(self.pickerController, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        navigationController?.present(alert, animated: true)
    }
    
    private func saveAvatar(uid: String, imageData: Data, completion: @escaping(String) -> Void) {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        let storageRef = Storage.storage().reference().child("users/\(uid)/avatar.jpg")
        
        storageRef.putData(imageData, metadata: metadata) { (_, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            storageRef.downloadURL { url, error in
                if let url = url?.absoluteString {
                    completion(url)
                }
            }
        }
    }
    
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.image = image
        avatarImageView.image = image
        pickerController.dismiss(animated: true)
    }
    
}
