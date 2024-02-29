//
//  GFFollowerItemVC.swift
//  GHFolowers
//
//  Created by Marek Srutka on 29.02.2024.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemIfonType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemIfonType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
