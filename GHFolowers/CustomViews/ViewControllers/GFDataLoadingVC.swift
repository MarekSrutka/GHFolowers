//
//  GFDataLoadingVC.swift
//  GHFolowers
//
//  Created by Marek Srutka on 29.02.2024.
//

import UIKit

// MARK: - GFDataLoadingVC

class GFDataLoadingVC: UIViewController {
    
    // MARK: - Properties
    
    var containerView: UIView!

    // MARK: - Loading View Methods
    
    /// Displays a loading view with a semi-transparent background and a spinning activity indicator.
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { self.containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.color = .systemGreen
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    /// Dismisses the loading view by removing it from the superview.
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    // MARK: - Empty State View Methods
    
    /// Displays an empty state view with a message.
    ///
    /// - Parameters:
    ///   - message: The message to be displayed in the empty state view.
    ///   - view: The view in which the empty state view will be added.
    func showEmptyStateView(message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
