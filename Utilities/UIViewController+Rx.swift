//
//  TabBar.swift
//  Utilities
//
//  Created by Dmytro Shapovalov on 12/28/18.
//  Copyright © 2018 pgmarchenko. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public enum ViewControllerViewState: Equatable {
    case viewWillAppear
    case viewDidAppear
    case viewWillDisappear
    case viewDidDisappear
    case viewDidLoad
    case viewDidLayoutSubviews
}

extension RxSwift.Reactive where Base: UIViewController {
    public var viewDidLoad: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidLoad))
            .map { _ in return }
    }
    
    public var viewDidLayoutSubviews: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidLayoutSubviews))
            .map { _ in return }
    }
    
    public var viewWillAppear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillAppear))
            .map { $0.first as? Bool ?? false }
    }
    
    public var viewDidAppear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewDidAppear))
            .map { $0.first as? Bool ?? false }
    }
    
    public var viewWillDisappear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillDisappear))
            .map { $0.first as? Bool ?? false }
    }
    
    public var viewDidDisappear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewDidDisappear))
            .map { $0.first as? Bool ?? false }
    }
    
    /**
     Observable sequence of the view controller's view state
     
     This gives you an observable sequence of all possible states.
     
     - returns: Observable sequence of AppStates
     */
    public var viewState: Observable<ViewControllerViewState> {
        return Observable.of(
            viewDidLoad.map {_ in return ViewControllerViewState.viewDidLoad },
            viewDidLayoutSubviews.map {_ in return ViewControllerViewState.viewDidLayoutSubviews },
            viewWillAppear.map {_ in return ViewControllerViewState.viewWillAppear },
            viewDidAppear.map {_ in return ViewControllerViewState.viewDidAppear },
            viewWillDisappear.map {_ in return ViewControllerViewState.viewWillDisappear },
            viewDidDisappear.map {_ in return ViewControllerViewState.viewDidDisappear }
            )
            .merge()
    }
}
