//
//  GFAvatarImageView.swift
//  GHFolowers
//
//  Created by Marek Srutka on 28.02.2024.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.share.cache
    let placeholderImage = UIImage(named: "avatar-placeholder")!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure () {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
