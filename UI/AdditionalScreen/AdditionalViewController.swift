//
//  AdditionalViewController.swift
//  UI
//
//  Created by Dmytro Shapovalov on 12/28/18.
//  Copyright © 2018 pgmarchenko. All rights reserved.
//

import Foundation
import UIKit

import RxSwift
import RxCocoa

public enum ChangeLableState: Int {
    case good_bye = 0
    case see_you = 1
    case left_without_saying_goodbye = 2
    case somewhere_here = 3
}

public let textList = ["good bye", "see you", "left without saying goodbye", "somewhere here"]

public class AdditionalViewController: UIViewController {
    
    public var onGoodByeClicked: ControlEvent<()> {
        return mainView.goodbyeButton.rx.controlEvent(.touchUpInside)
    }
    
    public var onSeeYouClicked: ControlEvent<()> {
        return mainView.seeYouButton.rx.controlEvent(.touchUpInside)
    }
    
    public func changeScreenLabelWith(state: ChangeLableState? ) {
        guard let i = state, skipSignal else { return }
        mainView.resultLabel.text = textList[i.rawValue]
    }
    
    let mainView = AdditionalScreenView()
    let disposeBag = DisposeBag()
    public var skipSignal = false
}

extension AdditionalViewController {
    public override func loadView() {
        view = mainView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}
