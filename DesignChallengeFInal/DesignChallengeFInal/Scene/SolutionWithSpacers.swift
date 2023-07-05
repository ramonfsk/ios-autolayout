//
//  SolutionWithSpacers.swift
//  DesignChallengeFInal
//
//  Created by Ramon Ferreira do Nascimento on 04/07/23.
//

import UIKit

class SolutionWithSpacers: UIViewController {
    lazy var bottomAnchorConstraint = NSLayoutConstraint()
    
    lazy var stackView = UIStackView()
    lazy var playerView = PlayerView(isUsingSpacer: true)
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        stackView = makeStackView(withOrientation: .vertical)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForOrientationChanges()
        setupViews()
    }
    
    private func registerForOrientationChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(SolutionWithSpacers.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            stackView.axis = .horizontal
            bottomAnchorConstraint.isActive = true
        } else {
            stackView.axis = .vertical
            bottomAnchorConstraint.isActive = false
        }
        
        playerView.adjustForOrientiation()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        [makeAlbumCoverImageView(),
         makePlayerStackView()].forEach(stackView.addArrangedSubview(_:))
        
        view.addSubview(stackView)
        
        bottomAnchorConstraint = stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func makeAlbumCoverImageView() -> UIImageView {
        let imageView = makeImageView(named: "rush")
        
        let heightAncorConstraint = imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
        heightAncorConstraint.priority = .defaultHigh
        heightAncorConstraint.isActive = true
        
        return imageView
    }
    
    private func makePlayerStackView() -> UIStackView {
        let stackView = makeStackView(withOrientation: .vertical)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0,
                                                                     leading: 8,
                                                                     bottom: 0,
                                                                     trailing: 8)
        
        stackView.addArrangedSubview(playerView)
        
        return stackView
    }
}
