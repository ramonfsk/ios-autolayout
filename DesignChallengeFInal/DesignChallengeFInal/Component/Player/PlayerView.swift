//
//  PlayerView.swift
//  DesignChallengeFInal
//
//  Created by Ramon Ferreira do Nascimento on 30/06/23.
//

import UIKit

class PlayerView: UIView {
    var isUsingSpacer: Bool
    
    lazy var topAnchorConstraint = NSLayoutConstraint()
    lazy var centerYConstraint = NSLayoutConstraint()
    
    lazy var stackView = UIStackView()
    
    lazy var topSpacer = UIView()
    lazy var bottomSpacer = UIView()
    
    init(isUsingSpacer: Bool = false) {
        self.isUsingSpacer = isUsingSpacer
        
        super.init(frame: .zero)
        
        if self.isUsingSpacer {
            topSpacer = makeSpacerView(height: 100)
            bottomSpacer = makeSpacerView(height: 100)
        } else {
            setupInitialOrientation()
        }
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 200)
    }
    
    private func setupViews() {
        stackView = makeStackView(withOrientation: .vertical)
        stackView.distribution = .fillProportionally
        
        let trackLabel = makeTrackLabel(withText: "Tom Sawyer")
        let albumLabel = makeAlbumLabel(withText: "Rush • Moving Pictures (2011 Remaster)")
        let playerView = ProgressRowView()
        let spotifyButton = makeSpotifyButtonCustomView()
        
        if isUsingSpacer {
            [topSpacer,
             trackLabel,
             albumLabel,
             playerView,
             spotifyButton,
             bottomSpacer].forEach(stackView.addArrangedSubview(_:))
        } else {
            [trackLabel,
             albumLabel,
             playerView,
             spotifyButton].forEach(stackView.addArrangedSubview(_:))
        }
        
        addSubview(stackView)
        
        if isUsingSpacer {
            NSLayoutConstraint.activate([
                topSpacer.heightAnchor.constraint(equalTo: bottomSpacer.heightAnchor),
                
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        }
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
        if isUsingSpacer {
            if UIDevice.current.orientation.isLandscape {
                topSpacer.isHidden = false
                bottomSpacer.isHidden = false
            } else {
                topSpacer.isHidden = true
                bottomSpacer.isHidden = true
            }
        } else {
            if UIDevice.current.orientation.isLandscape {
                topAnchorConstraint.isActive.toggle()
                centerYConstraint.isActive.toggle()
            } else {
                topAnchorConstraint.isActive.toggle()
                centerYConstraint.isActive.toggle()
            }
        }
    }
}
