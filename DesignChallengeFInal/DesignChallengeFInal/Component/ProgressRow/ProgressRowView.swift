//
//  ProgressRowView.swift
//  DesignChallengeFInal
//
//  Created by Ramon Ferreira do Nascimento on 30/06/23.
//

import UIKit

class ProgressRowView: UIView {
    let previewStartText: String
    let previewEndtext: String
    
    init(previewStartText: String = "0:00", previewEndtext: String = "0:30") {
        self.previewStartText = previewStartText
        self.previewEndtext = previewEndtext
        
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: buttonHeight)
    }
    
    func setupViews() {
        let playButton = makePlayButton()
        let previewStartLabel = makePreviewLabel(withText: previewStartText)
        let previewEndLabel = makePreviewLabel(withText: previewEndtext)
        let progressView = makeProgressView()
        
        [playButton,
         previewStartLabel,
         progressView,
         previewEndLabel].forEach(addSubview(_:))
        
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: topAnchor),
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            playButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            playButton.widthAnchor.constraint(equalToConstant: buttonHeight),
            
            previewStartLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            previewStartLabel.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 8),
            
            progressView.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            progressView.leadingAnchor.constraint(equalTo: previewStartLabel.trailingAnchor, constant: 8),
            
            previewEndLabel.centerYAnchor.constraint(equalTo: playButton.centerYAnchor),
            previewEndLabel.leadingAnchor.constraint(equalTo: progressView.trailingAnchor, constant: 8),
            previewEndLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
