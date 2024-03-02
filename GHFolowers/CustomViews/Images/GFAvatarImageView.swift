//
//  GFAvatarImageView.swift
//  GHFolowers
//
//  Created by Marek Srutka on 28.02.2024.
//

import UIKit

// MARK: - GFAvatarImageView

class GFAvatarImageView: UIImageView {
    
    // MARK: - Properties
    
    let cache = NetworkManager.share.cache
    let placeholderImage = Images.placeholder

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    
    private func configure () {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(fromURl url: String) {
        Task {
            image = await NetworkManager.share.downloadImage(from: url) ?? placeholderImage
        }
    }
}
