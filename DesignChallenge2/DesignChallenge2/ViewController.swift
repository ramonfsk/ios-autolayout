//
//  ViewController.swift
//  DesignChallenge2
//
//  Created by Ramon Ferreira do Nascimento on 26/06/23.
//

import UIKit

class ViewController: UIViewController {
    let margin: CGFloat = 8
    let spacing: CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }


    private func setupViews() {
        view.backgroundColor = .white
        
        let albumImage = makeImageView(named: "rush")
        let trackLabel = makeTrackLabel(withText: "Tom Sawyer")
        let albumLabel = makeAlbumLabel(withText: "Rush • Moving Pictures (2011 Remaster)")
        
        let playButton = makePlayButton()
        let previewStartLabel = makePreviewLabel(withText: "0:00")
        let previewEndLabel = makePreviewLabel(withText: "0:30")
        let progressView = makeProgressView()
        
        let spotifyButton = makeSpotifyButton(withText: "PLAY ON SPOTIFY")
        
        [albumImage,
         trackLabel,
         albumLabel,
         playButton,
         previewStartLabel,
         progressView,
         previewEndLabel,
         spotifyButton].forEach(view.addSubview(_:))
        
        playButton.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        
        NSLayoutConstraint.activate([
            albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            albumImage.widthAnchor.constraint(equalToConstant: view.bounds.width),
            albumImage.heightAnchor.constraint(equalTo: albumImage.widthAnchor, multiplier: 1),
            
            trackLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin),
            trackLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor, constant: margin),
            trackLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
            
            albumLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin),
            albumLabel.topAnchor.constraint(equalTo: trackLabel.bottomAnchor, constant: margin),
            albumLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
            
            playButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin),
            playButton.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: margin),
            playButton.widthAnchor.constraint(equalToConstant: buttonHeight),
            playButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            previewStartLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            previewStartLabel.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: margin),
            
            previewEndLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            previewEndLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
            
            progressView.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: previewStartLabel.trailingAnchor, constant: margin),
            progressView.trailingAnchor.constraint(equalTo: previewEndLabel.leadingAnchor, constant: -margin),
            
            // spotifyButton.heightAnchor we need to set to get our nice rounded corners - height is fixed
            // spotifyButton.widthAnchor we don't need to set because the intrinsic content size and insets are enough - width is dynamic
            spotifyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spotifyButton.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: spacing),
            spotifyButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
    }
}

