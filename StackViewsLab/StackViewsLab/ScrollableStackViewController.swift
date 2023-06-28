//
//  ScrollableStackViewController.swift
//  StackViewsLab
//
//  Created by Ramon Ferreira do Nascimento on 27/06/23.
//

import UIKit

class ScrollableStackViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        navigationItem.title = "Scrollable"
        
        view.backgroundColor = .white
        
        let stackView = makeStackView(withOrientation: .vertical)
        let scrollView = makeScrollView()
        
        scrollView.addSubview(stackView)
        
        [scrollView].forEach(view.addSubview(_:))
        
        for i in 1...40 {
            let row = RowView()
            stackView.addArrangedSubview(row)
            
            row.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1, constant: -32).isActive = true
            if i % 5 == 0 {
                stackView.addArrangedSubview(makeSpacerView(height: 200))
            }
        }
        
        // for padding and spacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 40,
                                                                     leading: 16,
                                                                     bottom: 40,
                                                                     trailing: -16)
        
        NSLayoutConstraint.activate([
            // pinning to the sides of view
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            // pinning scrollview
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
