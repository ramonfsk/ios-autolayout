//
//  LabelViewController.swift
//  IntrinsicContentSizeLab
//
//  Created by Ramon Ferreira do Nascimento on 26/06/23.
//

import UIKit

class LabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .white
        
        let label1 = makeLabel(withText: "label1")
        
        [label1].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            label1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
//            label1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
            
//            label1.widthAnchor.constraint(equalToConstant: 200),
//            label1.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func makeLabel(withText text: String) -> UILabel {
        let label = BigLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = text
        label.font = UIFont.systemFont(ofSize: 32)
        label.backgroundColor = .systemYellow
        
        return label
    }
}

class BigLabel: UILabel {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 300)
    }
}
