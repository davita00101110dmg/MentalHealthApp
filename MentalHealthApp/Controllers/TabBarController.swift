//
//  TabBarController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 03.08.22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }
    
    private func setupTabBar() {
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
    }
    
}
