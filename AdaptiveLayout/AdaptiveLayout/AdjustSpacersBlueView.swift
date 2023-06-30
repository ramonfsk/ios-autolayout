//
//  AdjustSpacersBlueView.swift
//  AdaptiveLayout
//
//  Created by Ramon Ferreira do Nascimento on 29/06/23.
//

import UIKit

class AdjustSpacersBlueView: UIView {
    let topSpacer = makeSpacerView(height: 100)
    let bottomSpacer = makeSpacerView(height: 100)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
    private func setupViews() {
        backgroundColor = .systemBlue
        
        topSpacer.backgroundColor = .white
        bottomSpacer.backgroundColor = .white
        
        let label = makeLabel(withText: "Adjusting via spacers", size: 24)
        let stackView = makeStackView(withOrientation: .vertical)
        
        [topSpacer,
         label,
         bottomSpacer].forEach(stackView.addArrangedSubview(_:))
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // for padding and spacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20,
                                                                     leading: 20,
                                                                     bottom: 20,
                                                                     trailing: 20)
        
        adjustConstraints()
    }
    
    func adjustConstraints() {
        if UIWindow.isLandscape {
            topSpacer.isHidden = false
            bottomSpacer.isHidden = false
        } else {
            topSpacer.isHidden = true
            bottomSpacer.isHidden = true
        }
    }
}
