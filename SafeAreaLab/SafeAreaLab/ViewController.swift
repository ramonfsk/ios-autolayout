//
//  ViewController.swift
//  SafeAreaLab
//
//  Created by Ramon Ferreira do Nascimento on 25/06/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        let topLabel = makeLabel(withText: "top")
        let bottomLabel = makeLabel(withText: "bottom")
        let leadingLabel = makeLabel(withText: "leading")
        let traillingLabel = makeLabel(withText: "trailling")
        
        [topLabel,
         bottomLabel,
         leadingLabel,
         traillingLabel].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
//            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Challenge: Add a bottom label
        NSLayoutConstraint.activate([
//            bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Challenge: Add 8pt spacing to the top and bottom label
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            leadingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            leadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            traillingLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            traillingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .systemYellow
        label.font = UIFont.systemFont(ofSize: 32)
        
        return label
    }
}

