//
//  BlueView.swift
//  DesignChallenge4
//
//  Created by Ramon Ferreira do Nascimento on 29/06/23.
//

import UIKit

//
// Challenge: Set the constraints on the label in this view so that when the
//            view is in portrait, the label is 8pts from the top (topAnchor)
//            and when the view is in landscape, it is centered vertically (centerY).
//

class BlueView: UIView {
    var topAnchorConstraint = NSLayoutConstraint()
    var centerYAnchorConstraint = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    private func setupViews() {
        backgroundColor = .blue
        
        let label = makeLabel(withText: "Adjusting constraints", size: 24)
        
        addSubview(label)
        
        // Static constraints
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        // Dynamic constraints
        topAnchorConstraint = label.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        centerYAnchorConstraint = label.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        adjustConstraints()
    }
    
    func adjustConstraints() {
        if UIWindow.isLandscape {
            topAnchorConstraint.isActive = false
            centerYAnchorConstraint.isActive = true
        } else {
            topAnchorConstraint.isActive = true
            centerYAnchorConstraint.isActive = false
        }
    }
}
