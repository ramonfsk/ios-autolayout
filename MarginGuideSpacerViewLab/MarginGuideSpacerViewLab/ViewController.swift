//
//  ViewController.swift
//  MarginGuideSpacerViewLab
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
        let leadingGuide = UILayoutGuide()
        let okButton = makeButton(title: "OK", color: .darkBlue)
        let middleGuide = UILayoutGuide()
        let cancelButton = makeButton(title: "Cancel", color: .darkGreen)
        let traillingGuide = UILayoutGuide()
        
        [okButton,
         cancelButton].forEach(view.addSubview(_:))
        
        [leadingGuide,
         middleGuide,
         traillingGuide].forEach(view.addLayoutGuide(_:))
        
        // setup constraints
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            // leading guide
            margins.leadingAnchor.constraint(equalTo: leadingGuide.leadingAnchor),
            leadingGuide.trailingAnchor.constraint(equalTo: okButton.leadingAnchor),
            
            // middle guide
            okButton.trailingAnchor.constraint(equalTo: middleGuide.leadingAnchor),
            middleGuide.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor),
            
            // trailling guide
            cancelButton.trailingAnchor.constraint(equalTo: traillingGuide.leadingAnchor),
            traillingGuide.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            
            // button equal widths
            okButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor),
            
            // spacer equal widths
            leadingGuide.widthAnchor.constraint(equalTo: middleGuide.widthAnchor),
            leadingGuide.widthAnchor.constraint(equalTo: traillingGuide.widthAnchor),
            
            // vertical position
            leadingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            middleGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            traillingGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            okButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cancelButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // giving layout guides default height
            leadingGuide.heightAnchor.constraint(equalToConstant: 1),
            middleGuide.heightAnchor.constraint(equalToConstant: 1),
            traillingGuide.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func makeButton(title: String, color: UIColor) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
//        button.contentEdgeInsets = UIEdgeInsets.init(top: 8,
//                                                     left: 16,
//                                                     bottom: 8,
//                                                     right: 16)
//        button.backgroundColor = color
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = color
        config.contentInsets = NSDirectionalEdgeInsets(top: 8,
                                                       leading: 16,
                                                       bottom: 8,
                                                       trailing: 16)
        button.configuration = config
        
        return button
    }
}

extension UIColor {
    static let darkBlue = UIColor(red: 10/255, green: 132/255, blue: 255/255, alpha: 1)
    static let darkGreen = UIColor(red: 48/255, green: 209/255, blue: 88/255, alpha: 1)
//    static let darkOrange = UIColor(red: 255/255, green: 149/255, blue: 0/255, alpha: 1)
//    static let darkRed = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1)
//    static let darkTeal = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
//    static let darkYellow = UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)
}
