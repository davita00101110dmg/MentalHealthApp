//
//  TabBarController.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 03.08.22.
//

import UIKit
import FirebaseAuth
import Firebase


class TabBarController: UITabBarController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        // Setting tap bar appareance
        self.tabBar.backgroundColor = Color.whiteColor
        self.tabBar.tintColor = .black
        self.tabBar.layer.cornerRadius = 20
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
        
    }
    
}
