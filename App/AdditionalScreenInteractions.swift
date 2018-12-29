//
//  AdditionalScreenInteractions.swift
//  App
//
//  Created by Dmytro Shapovalov on 12/28/18.
//  Copyright © 2018 pgmarchenko. All rights reserved.
//

import RxSwift
import RxCocoa

import UI
import Utilities

extension AdditionalViewController {
    @discardableResult
    public func assembleInteractions(with topDisposer: CompositeDisposable = .init()) -> DownloadScreenInteractor {
        let interactor = DownloadScreenInteractor()
    
        rx.viewDidDisappear.subscribe({ [weak self] _ in
            self?.changeScreenLabelWith(state: .left_without_saying_goodbye)
        }).disposed(by: topDisposer)
        
        rx.viewDidAppear.subscribe({ [weak self] _ in
            self?.skipSignal = false
            }).disposed(by: topDisposer)
        
        self.onGoodByeClicked.bind { [weak self] in
            self?.changeScreenLabelWith(state: .good_bye)
            self?.onFirstTab()
            }.disposed(by: topDisposer)
        
        self.onSeeYouClicked.bind { [weak self] in
            self?.changeScreenLabelWith(state: .see_you)
            self?.onFirstTab()
            }.disposed(by: topDisposer)

        UIApplication.shared.rx.applicationDidEnterBackground
            .subscribe({ [weak self] _ in
               self?.changeScreenLabelWith(state: .somewhere_here)
            })
            .disposed(by: topDisposer)
        
        return interactor
    }
    
    private func onFirstTab() {
        self.skipSignal = true
        let secondVC = tabBarController!
        secondVC.selectedIndex = 0
    }
}
