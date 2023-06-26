//
//  TextFieldViewController.swift
//  IntrinsicContentSizeLab
//
//  Created by Ramon Ferreira do Nascimento on 26/06/23.
//

import UIKit

class TextFieldViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        let nameLabel = makeLabel(withText: "Name")
        let nameTextField = makeTextField(withPlaceholderText: "Enter name here")
        
        [nameLabel,
         nameTextField].forEach(view.addSubview(_:))
        
        nameLabel.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            nameTextField.firstBaselineAnchor.constraint(equalTo: nameLabel.firstBaselineAnchor),
        ])
    }
    
    private func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .systemYellow
        
        return label
    }
    
    private func makeTextField(withPlaceholderText text: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = text
        textField.backgroundColor = .lightGray
        
        return textField
    }
}
