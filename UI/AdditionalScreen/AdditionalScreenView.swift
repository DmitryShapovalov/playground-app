//
//  AdditionalScreenView.swift
//  UI
//
//  Created by Dmytro Shapovalov on 12/28/18.
//  Copyright © 2018 pgmarchenko. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class AdditionalScreenView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        assemble()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let resultLabel = UILabel()
    
    let goodbyeButton = UIButton()
    let seeYouButton = UIButton()
}

extension AdditionalScreenView {
    private func assemble() {
        
        configurateViews()

        addSubview(resultLabel)
        addSubview(goodbyeButton)
        addSubview(seeYouButton)
        
        setupLayout()
    }
    
    private func configurateViews() {
        self.backgroundColor = .lightGray
        
        resultLabel.text = NSLocalizedString("open first time", comment: "Additional Screen Label")
        
        goodbyeButton.setTitle(NSLocalizedString("Goodbye", comment: "Additional Screen Button"), for: .normal)
        goodbyeButton.backgroundColor = .blue
        seeYouButton.setTitle(NSLocalizedString("See you", comment: "Additional Screen Button"), for: .normal)
        seeYouButton.backgroundColor = .red
    }
    
    private func setupLayout() {
        resultLabel.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
        
        goodbyeButton.snp.makeConstraints { make in
            make.bottomMargin.equalTo(self.snp.bottomMargin).inset(50)
            make.leading.equalTo(self.snp.leading).inset(20)
            make.size.equalTo(CGSize.init(width: 130, height: 30))
        }
        
        seeYouButton.snp.makeConstraints { make in
            make.bottomMargin.equalTo(goodbyeButton)
            make.trailing.equalTo(self.snp.trailing).inset(20)
            make.size.equalTo(goodbyeButton)
        }
    }
}
