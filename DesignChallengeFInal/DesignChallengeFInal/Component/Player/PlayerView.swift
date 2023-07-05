//
//  PlayerView.swift
//  DesignChallengeFInal
//
//  Created by Ramon Ferreira do Nascimento on 30/06/23.
//

import UIKit

class PlayerView: UIView {
    var topAnchorConstraint = NSLayoutConstraint()
    var centerYConstraint = NSLayoutConstraint()
    
    lazy var stackView = UIStackView()
    
    init() {
        super.init(frame: .zero)
        
        stackView = makeStackView(withOrientation: .vertical)
        stackView.distribution = .fillProportionally
        
        setupViews()
        setupInitialOrientation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 200)
    }
    
    private func setupViews() {
        let trackLabel = makeTrackLabel(withText: "Tom Sawyer")
        let albumLabel = makeAlbumLabel(withText: "Rush • Moving Pictures (2011 Remaster)")
        let playerView = ProgressRowView()
        let spotifyButton = makeSpotifyButtonCustomView()
        
        [trackLabel,
         albumLabel,
         playerView,
         spotifyButton].forEach(stackView.addArrangedSubview(_:))
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func setupInitialOrientation() {
        topAnchorConstraint = stackView.topAnchor.constraint(equalTo: topAnchor)
        centerYConstraint = stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        if UIDevice.current.orientation.isLandscape {
            topAnchorConstraint.isActive = true
            centerYConstraint.isActive = false
        } else {
            topAnchorConstraint.isActive = false
            centerYConstraint.isActive = true
        }
    }
    
    private func makeSpotifyButtonCustomView() -> UIView {
        let spotifyButton = makeSpotifyButton(withText: "PLAY ON SPOTIFY")

        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        container.addSubview(spotifyButton)

        spotifyButton.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        spotifyButton.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        spotifyButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true

        return container
    }
    
    func adjustForOrientiation() {
        if UIDevice.current.orientation.isLandscape {
            topAnchorConstraint.isActive.toggle()
            centerYConstraint.isActive.toggle()
        } else {
            topAnchorConstraint.isActive.toggle()
            centerYConstraint.isActive.toggle()
        }
    }
}
