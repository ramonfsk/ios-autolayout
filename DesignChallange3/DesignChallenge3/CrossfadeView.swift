//
//  CrossfadeView.swift
//  DesignChallenge3
//
//  Created by Ramon Ferreira do Nascimento on 28/06/23.
//

import UIKit

class CrossfadeView: UIView {
    let crossfadeTitleText: String
    let crossfadeMinText: String
    let crossfadeMaxText: String
    
    let margin: CGFloat = 4
    let spacing: CGFloat = 32
    
    init(crossfadeTitleText: String, crossfadeMinText: String = "0s", crossfadeMaxText: String = "12s") {
        self.crossfadeTitleText = crossfadeTitleText
        self.crossfadeMinText = crossfadeMinText
        self.crossfadeMaxText = crossfadeMaxText
        
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300, height: 100)
    }
    
    private func setupViews() {
        let crossfadeLabel = makeBoldLabel(withText: crossfadeTitleText)
        let crossfadeMinLabel = makeSubLabel(withText: crossfadeMinText)
        let crossfadeMaxLabel = makeSubLabel(withText: crossfadeMaxText)
        let crossfadeProgressView = makeProgressView()
        
        [crossfadeLabel,
         crossfadeMinLabel,
         crossfadeProgressView,
         crossfadeMaxLabel].forEach(addSubview(_:))
        
        NSLayoutConstraint.activate([
            crossfadeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            crossfadeLabel.topAnchor.constraint(equalTo: topAnchor),
            
            crossfadeMinLabel.topAnchor.constraint(equalTo: crossfadeLabel.bottomAnchor, constant: spacing),
            crossfadeMinLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            crossfadeProgressView.centerYAnchor.constraint(equalTo: crossfadeMinLabel.centerYAnchor),
            crossfadeProgressView.leadingAnchor.constraint(equalTo: crossfadeMinLabel.trailingAnchor, constant: margin),
            crossfadeProgressView.trailingAnchor.constraint(equalTo: crossfadeMaxLabel.leadingAnchor, constant: -margin),
            
            crossfadeMaxLabel.centerYAnchor.constraint(equalTo: crossfadeMinLabel.centerYAnchor),
            crossfadeMaxLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
