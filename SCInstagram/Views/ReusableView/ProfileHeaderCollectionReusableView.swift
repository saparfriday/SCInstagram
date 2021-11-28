//
//  ProfileHeaderCollectionReusableView.swift
//  SCInstagram
//
//  Created by user on 28.11.2021.
//

import UIKit
import Kingfisher

class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Views

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
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImageView.layer.cornerRadius = 50
        
        primaryButton.layer.borderWidth = 1
        primaryButton.layer.borderColor = UIColor.placeholderText.cgColor
    }
    
    // MARK: - Actions
    
    @IBAction func primaryButtonDidTapped(_ sender: Any) {
    }
    
    // MARK: - Methods
    
    func setup(_ user: User) {
        avatarImageView.kf.setImage(with: URL(string: user.avatarURL))
        postsCounterLabel.text = String(user.counters.posts)
        postsCounterLabel.textColor = user.counters.posts != 0 ? .label : .secondaryLabel
        followersCounterLabel.text = String(user.counters.followers)
        followersCounterLabel.textColor = user.counters.followers != 0 ? .label : .secondaryLabel
        followingsCounterLabel.text = String(user.counters.followings)
        followingsCounterLabel.textColor = user.counters.followings != 0 ? .label : .secondaryLabel
        usernameLabel.text = user.username
        bioLabel.text = user.bio
    }
    
}
