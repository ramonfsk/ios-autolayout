//
//  ExampleFourViewController.swift
//  AdaptiveLayout
//
//  Created by Ramon Ferreira do Nascimento on 29/06/23.
//

import UIKit

class ExampleFourViewController: UIViewController {
    var stackView: UIStackView
    let blueView = AdjustSpacersBlueView()
    
    init() {
        stackView = makeStackView(withOrientation: .vertical)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForOrientationChanges()
        setupViews()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func registerForOrientationChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(ExampleFourViewController.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        navigationItem.title = "Adjusting via Spacers"
        
        let redView = RedView()
        
        [redView,
         blueView].forEach(stackView.addArrangedSubview(_:))
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            redView.heightAnchor.constraint(equalTo: blueView.heightAnchor),
            redView.widthAnchor.constraint(equalTo: blueView.widthAnchor),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc func rotated() {
        blueView.adjustConstraints()
        
        if UIDevice.current.orientation.isLandscape {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
    }
}
