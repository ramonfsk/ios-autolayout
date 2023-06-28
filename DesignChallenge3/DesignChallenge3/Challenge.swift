//
//  Challenge.swift
//  DesignChallenge3
//
//  Created by Ramon Ferreira do Nascimento on 28/06/23.
//

import UIKit

class Challenge: UIViewController {
    let margin: CGFloat = 20
    let stackViewMargin: CGFloat = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViews()
    }
    
    func setupNavigationBar() {
        view.backgroundColor = .black
        
        navigationItem.title = "Playback"
    }

    /*
         Challenge: See if you can embed all these controls in a StackView like this.
     
         ┌────────StackView─────────┐
         │                          │
         │        offlineRow        │
         │                          │
         │      offlineSublabel     │
         │                          │   axis = vertical
         │       crossfadeView      │   distribution = fill
         │                          │   alignment = fill
         │        gaplessRow        │   spacing = 20
         │                          │
         │       hideSongsRow       │
         │                          │
         │     normalizationRow     │
         │                          │
         └──────────────────────────┘
     */
    
    func setupViews() {
        let stackView = makeStackView(withOrientation: .vertical)
        
        let offlineRow = RowView(titleText: "Offline")
        let offlineSublabel = makeSubLabel(withText: "When you go offline, you'll only be able to play the music and podcasts you've downloaded.")
        
        let crossfadeView = CrossfadeView(crossfadeTitleText: "Crossfade")

        let gaplessPlaybackRow = RowView(titleText: "Gapless Playback", isOnSwitch: true)

        let hideSongsRow = RowView(titleText: "Hide Unplayable Songs", isOnSwitch: true)

        let enableNormalizationRow = RowView(titleText: "Enable Audio Normalization", isOnSwitch: true)

        [offlineRow,
         offlineSublabel,
         crossfadeView,
         gaplessPlaybackRow,
         hideSongsRow,
         enableNormalizationRow].forEach(stackView.addArrangedSubview(_:))
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        // pinning and spacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: stackViewMargin,
                                                                     leading: stackViewMargin,
                                                                     bottom: stackViewMargin,
                                                                     trailing: stackViewMargin)
    }
}

