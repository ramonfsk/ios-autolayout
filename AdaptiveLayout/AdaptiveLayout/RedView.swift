//
//  RedView.swift
//  AdaptiveLayout
//
//  Created by Ramon Ferreira do Nascimento on 29/06/23.
//

import UIKit

class RedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 100)
    }
    
    private func setupViews() {
        backgroundColor = .red
    }
}
