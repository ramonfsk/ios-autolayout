//
//  ViewController.swift
//  ReadableContentGuideViewLab
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
        let label = makeLabel(withText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Id neque aliquam vestibulum morbi blandit cursus risus at ultrices. Pulvinar sapien et ligula ullamcorper malesuada proin libero nunc consequat. Ornare massa eget egestas purus viverra accumsan in nisl. Purus sit amet luctus venenatis lectus magna fringilla urna. Volutpat sed cras ornare arcu dui vivamus. Consectetur adipiscing elit ut aliquam purus sit. Proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo. Habitant morbi tristique senectus et netus. Sed viverra ipsum nunc aliquet bibendum enim facilisis gravida. Et malesuada fames ac turpis egestas integer. Interdum posuere lorem ipsum dolor sit amet consectetur adipiscing. At volutpat diam ut venenatis tellus in. Aliquam ut porttitor leo a diam sollicitudin tempor. Tincidunt augue interdum velit euismod in. Id eu nisl nunc mi ipsum. Elementum nisi quis eleifend quam adipiscing vitae proin sagittis nisl. Suspendisse in est ante in nibh mauris cursus mattis molestie. Tristique sollicitudin nibh sit amet commodo nulla facilisi.")
        
        [label].forEach(view.addSubview(_:))
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            label.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
            label.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor)
        ])
    }
    
    private func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .systemYellow
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }
}
