//
//  RowView.swift
//  DesignChallenge3
//
//  Created by Ramon Ferreira do Nascimento on 28/06/23.
//

import UIKit

class RowView: UIView {
    let titleText: String
    let isOnSwitch: Bool
    
    init(titleText: String, isOnSwitch: Bool = false) {
        self.titleText = titleText
        self.isOnSwitch = isOnSwitch
        
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 32)
    }
    
    private func setupViews() {
        let titleLabel = makeLabel(withText: titleText)
        let onOffSwitch = makeSwitch(isOn: isOnSwitch)
        
        [titleLabel,
         onOffSwitch].forEach(addSubview(_:))
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            onOffSwitch.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            onOffSwitch.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
