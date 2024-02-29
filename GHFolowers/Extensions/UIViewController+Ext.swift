//
//  UIViewController+Ext.swift
//  GHFolowers
//
//  Created by Marek Srutka on 28.02.2024.
//

import UIKit
import SafariServices

// MARK: - UIViewController Extension

extension UIViewController {
    
    // MARK: - Public Methods
    
    /// Presents a custom alert on the main thread.
    /// - Parameters:
    ///   - title: The title of the alert.
    ///   - message: The message displayed in the alert.
    ///   - buttonTitle: The title of the button in the alert.
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    /// Presents a Safari view controller to display a web page.
    /// - Parameter url: The URL of the web page.
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
