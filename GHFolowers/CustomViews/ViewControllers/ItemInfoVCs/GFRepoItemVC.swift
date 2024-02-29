//
//  GFRepoItemVC.swift
//  GHFolowers
//
//  Created by Marek Srutka on 29.02.2024.
//

import UIKit

// MARK: - GFRepoItemVC

class GFRepoItemVC: GFItemInfoVC {
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    // MARK: - UI Configuration
    
    private func configureItems() {
        // Set up the first item info view with repository count
        itemInfoViewOne.set(itemIfonType: .repos, withCount: user.publicRepos)
        
        // Set up the second item info view with gists count
        itemInfoViewTwo.set(itemIfonType: .gists, withCount: user.publicGists)
        
        // Set up the action button for GitHub Profile
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    // MARK: - Actions
    
    override func actionButtonTapped() {
        // Handle action button tap to open GitHub Profile
        delegate.didTapGitHubProfile(for: user)
    }
}
