//
//  ProfileViewController.swift
//  SCInstagram
//
//  Created by user on 28.11.2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ProfileViewController: UIViewController {
    
    // MARK: - Data
    
    var myUser: User?
    
    // MARK: - Views

    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMyUser()
        configureLayout()
    }
    
    // MARK: - Actions
    
    @objc func settingsDidTapped() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { _ in
            
            do {
                try Auth.auth().signOut()
                self.dismiss(animated: true)
            } catch {
                print(error.localizedDescription)
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        navigationController?.present(alert, animated: true)
    }
    
    // MARK: - Methods
    
    private func fetchMyUser() {
        let uid = Auth.auth().currentUser?.uid ?? "uidNotFound"
        let ref = Firestore.firestore().collection("users").document(uid)
        
        ref.getDocument { documentSnapshot, error in
            if let error = error {
                self.showHUD(.error(text: error.localizedDescription))
                return
            }
            
            if let documentSnapshot = documentSnapshot, documentSnapshot.exists {
                do {
                    let model = try documentSnapshot.data(as: User.self)
                    self.myUser = model
                    self.collectionView.reloadData()
                } catch {
                    self.showHUD(.error(text: error.localizedDescription))
                }
            }
        }
        
    }
    
    // MARK: - Layout
    
    private func configureLayout() {
        navigationItem.title = "Profile"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(settingsDidTapped))
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ProfileHeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeaderCollectionReusableView")
    }

}

// MARK: - CollectionView Delegate

extension ProfileViewController: UICollectionViewDelegate {
    
}

// MARK: - CollectionView DataSource

extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeaderCollectionReusableView", for: indexPath) as! ProfileHeaderCollectionReusableView
        if let user = myUser {
            headerView.setup(user)
        }
        return headerView
    }
    
}

// MARK: - CollectionView FlowLayout

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        // Get the view for  the first header
        let indexPath = IndexPath(row: 0, section: section)
        let headerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)
        
        return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width,
                                                         height: UIView.layoutFittingExpandedSize.height),
                                                  withHorizontalFittingPriority: .required,
                                                  verticalFittingPriority: .fittingSizeLevel)
    }
    
}
