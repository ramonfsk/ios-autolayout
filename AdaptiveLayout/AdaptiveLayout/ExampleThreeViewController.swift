//
//  ExampleThreeViewController.swift
//  AdaptiveLayout
//
//  Created by Ramon Ferreira do Nascimento on 29/06/23.
//

import UIKit

class ExampleThreeViewController: UIViewController {
    let label2 = makeLabel(withText: "Now you don't", size: 32, color: .systemRed)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        label2.isHidden = !label2.isHidden
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        let stackView = makeStackView(withOrientation: .vertical)
        stackView.distribution = .fillProportionally
        
        let label1 = makeLabel(withText: "Now you see me", size: 32)
        let butoon = makeButton(withText: "Show/Hide", size: 32)
        butoon.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
        
        [label1,
         label2,
         butoon].forEach(stackView.addArrangedSubview(_:))
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
