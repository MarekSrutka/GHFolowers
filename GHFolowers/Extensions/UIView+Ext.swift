//
//  UIView+Ext.swift
//  GHFolowers
//
//  Created by Marek Srutka on 29.02.2024.
//

import UIKit

// MARK: - UIView Extension

extension UIView {
    
    // MARK: - Public Methods
    
    /// Adds an array of subviews to the current view.
    /// - Parameter views: The array of subviews to be added.
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
