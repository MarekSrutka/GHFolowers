//
//  GFFollowerItemVC.swift
//  GHFolowers
//
//  Created by Marek Srutka on 29.02.2024.
//

import UIKit

// MARK: - GFFollowerItemVC

class GFFollowerItemVC: GFItemInfoVC {
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    // MARK: - UI Configuration
    
    private func configureItems() {
        // Set up the first item info view with followers count
        itemInfoViewOne.set(itemIfonType: .followers, withCount: user.followers)
        
        // Set up the second item info view with following count
        itemInfoViewTwo.set(itemIfonType: .following, withCount: user.following)
        
        // Set up the action button to get followers
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    // MARK: - Actions
    
    override func actionButtonTapped() {
        // Handle action button tap to get followers
        delegate.didTapGetFollowers(for: user)
    }
}
