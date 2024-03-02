//
//  GFButton.swift
//  GHFolowers
//
//  Created by Marek Srutka on 28.02.2024.
//

import UIKit

// MARK: - GFButton

class GFButton: UIButton {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, color: UIColor, systemImageName: UIImage?) {
        self.init(frame: .zero)
       set(color: color, title: title, systemImageName: systemImageName)
    }
    
    // MARK: - Private Methods
    
    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Public Methods
    
    final func set(color: UIColor, title: String, systemImageName: UIImage?) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
        
        configuration?.image = systemImageName
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
}

#Preview {
    return GFButton(title: "Test", color: .blue, systemImageName: SFSymbols.persons)
}
