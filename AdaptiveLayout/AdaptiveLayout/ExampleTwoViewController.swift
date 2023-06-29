//
//  ExampleTwoViewController.swift
//  AdaptiveLayout
//
//  Created by Ramon Ferreira do Nascimento on 29/06/23.
//

import UIKit

class ExampleTwoViewController: UIViewController {
    var leadingAnchorConstraint = NSLayoutConstraint()
    var traillingAnchorConstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        if leadingAnchorConstraint.isActive {
            leadingAnchorConstraint.isActive.toggle()
            traillingAnchorConstraint.isActive.toggle()
        } else {
            leadingAnchorConstraint.isActive.toggle()
            traillingAnchorConstraint.isActive.toggle()
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        let label = makeLabel(withText: "Watch me!", size: 32)
        label.textColor = .black
        
        let button = makeButton(withText: "Left/Right")
        button.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
        
        leadingAnchorConstraint = label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80)
        traillingAnchorConstraint = label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80)
        
        [label,
         button].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            leadingAnchorConstraint,
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
