//
//  GFRepoItemVC.swift
//  GHFolowers
//
//  Created by Marek Srutka on 29.02.2024.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemIfonType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemIfonType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
