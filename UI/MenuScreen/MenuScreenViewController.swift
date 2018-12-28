//
//  MenuScreenViewController.swift
//  UI
//
//  Created by Pavel Marchenko on 10/2/18.
//  Copyright © 2018 pgmarchenko. All rights reserved.
//

import Foundation
import UIKit

public class MenuScreenViewController: UITabBarController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadScreen.tabBarItem = UITabBarItem.init(title: "Download", image: nil, selectedImage: nil)
        magiColorScreen.tabBarItem = UITabBarItem.init(title: "MagiColor", image: nil, selectedImage: nil)
        additionalScreen.tabBarItem = UITabBarItem.init(title: "Additional", image: nil, selectedImage: nil)
        
        viewControllers = [downloadScreen, magiColorScreen, additionalScreen]
    }
    
    // private 
    public let downloadScreen = DownloadScreenViewController()
    public let magiColorScreen = MagiColorScreenViewController()
    public let additionalScreen = AdditionalViewController()
}
