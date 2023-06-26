//
//  ImageViewController.swift
//  IntrinsicContentSizeLab
//
//  Created by Ramon Ferreira do Nascimento on 26/06/23.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        let image = makeImageView(named: "darkside50")
        let label = makeLabel(withText: "Title")
        let button = makeButton(withText: "Get Started")
        
        [image,
         label,
         button].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            // imageViews by themselves have intrinsic size
            image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 300),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
        
    }
    
    private func makeImageView(named: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: named)
        
        imageView.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultHigh - 1, for: .vertical)
        
        return imageView
    }
    
    private func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 32)
        label.text = text
        label.backgroundColor = .systemYellow

        return label
    }
    
    private func makeButton(withText text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(text, for: .normal)

        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemBlue
        config.contentInsets = NSDirectionalEdgeInsets(top: 8,
                                                       leading: 16,
                                                       bottom: 8,
                                                       trailing: 16)
        button.configuration = config
        
        return button
    }
}
