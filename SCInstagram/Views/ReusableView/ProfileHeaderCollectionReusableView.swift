//
//  ProfileHeaderCollectionReusableView.swift
//  SCInstagram
//
//  Created by user on 28.11.2021.
//

import UIKit

class ProfileHeaderCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var postsCounterLabel: UILabel!
    
    @IBOutlet weak var followersCounterLabel: UILabel!
    
    @IBOutlet weak var followingsCounterLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var primaryButton: UIButton!
    
    @IBOutlet weak var postsStackView: UIStackView!
    
    @IBOutlet weak var followersStackView: UIStackView!
    
    @IBOutlet weak var followingsStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImageView.layer.cornerRadius = 50
        
        primaryButton.layer.borderWidth = 1
        primaryButton.layer.borderColor = UIColor.placeholderText.cgColor
    }
    
    @IBAction func primaryButtonDidTapped(_ sender: Any) {
    }
    
}
