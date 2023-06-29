//
//  ExampleOneViewController.swift
//  AdaptiveLayout
//
//  Created by Ramon Ferreira do Nascimento on 28/06/23.
//

import UIKit

class ExampleOneViewController: UIViewController {
    var topAnchorConstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        if topAnchorConstraint.constant == 80 {
            topAnchorConstraint.constant = 80 * 2
        } else {
            topAnchorConstraint.constant = 80
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        let label = makeLabel(withText: "Watch me!", size: 32)
        label.textColor = .black
        
        let button = makeButton(withText: "Up/Down")
        button.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
        
        topAnchorConstraint = label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80)
        
        [label,
         button].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            topAnchorConstraint,
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

