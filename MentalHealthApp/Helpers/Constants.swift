//
//  Constants.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

// Initializing constant colors for the project.
let mainColor = UIColor(red: 251/255, green: 249/255, blue: 219/255, alpha: 1)
let redColor = UIColor(red: 197/255, green: 105/255, blue: 95/255, alpha: 1)
let greenColor = UIColor(red: 80/255, green: 103/255, blue: 27/255, alpha: 1)
let grayColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
let lightGreen = UIColor(red: 238/255, green: 243/255, blue: 223/255, alpha: 1)

// Initializing tab bar item size and their images.
let tabBarItemSize = CGSize(width: 30, height: 30)
let activeHomeImage = UIImage(named: "home_active")?.imageResized(to: tabBarItemSize)
let inactiveHomeImage = UIImage(named: "home_inactive")?.imageResized(to: tabBarItemSize)
let activeProfileImage = UIImage(named: "user_active")?.imageResized(to: tabBarItemSize)
let inactiveProfileImage = UIImage(named: "user_inactive")?.imageResized(to: tabBarItemSize)
