//
//  FollowerCell.swift
//  GHFolowers
//
//  Created by Marek Srutka on 28.02.2024.
//

import UIKit
import SwiftUI

// MARK: - FollowerCell

class FollowerCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let reuseID = "FollowerCell"
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func set(follower: Follower) {
        contentConfiguration = UIHostingConfiguration {
            FollowerView(follower: follower)
        }
    }
}
