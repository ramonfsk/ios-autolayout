//
//  CHCRFillViewController.swift
//  StackViewsLab
//
//  Created by Ramon Ferreira do Nascimento on 27/06/23.
//

import UIKit

class CHCRFillViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .white
        
        navigationItem.title = "CHCR Fill"
        
        let stackView = makeStackView(withOrientation: .vertical)
        stackView.distribution = .fill
        
        let bigLabel = makeLabel(withText: "Big", size: 128, color: .darkYellow)
        let medLabel = makeLabel(withText: "Med", size: 64, color: .darkOrange)
        let smlLabel = makeLabel(withText: "Sml", size: 32, color: .darkGreen)
        
        [medLabel,
         bigLabel,
         smlLabel].forEach(stackView.addArrangedSubview(_:))
        
        [stackView].forEach(view.addSubview(_:))
        
        bigLabel.setContentHuggingPriority(.fittingSizeLevel - 2, for: .vertical)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

