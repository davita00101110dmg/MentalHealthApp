//
//  Constants.swift
//  MentalHealthApp
//
//  Created by Dato Khvedelidze on 30.07.22.
//

import UIKit

// Initializing constant colors for the project.
let mainColor = UIColor(red: 252/255, green: 251/255, blue: 221/255, alpha: 1)
let redColor = UIColor(red: 197/255, green: 105/255, blue: 95/255, alpha: 1)
let greenColor = UIColor(red: 145/255, green: 163/255, blue: 98/255, alpha: 1)
let lightGreenColor = UIColor(red: 238/255, green: 243/255, blue: 223/255, alpha: 1)
let grayColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
let whiteColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)

// Initializing icon sizes
let defaultIconSize = CGSize(width: 30, height: 30)
let biggerIconSize = CGSize(width: 75, height: 75)
let biggestIconSize = CGSize(width: 275, height: 275)

// Initializing images
let activeHomeImage = UIImage(named: "home_active")!.imageResized(to: defaultIconSize)
let inactiveHomeImage = UIImage(named: "home_inactive")!.imageResized(to: defaultIconSize)
let activeProfileImage = UIImage(named: "user_active")!.imageResized(to: defaultIconSize)
let inactiveProfileImage = UIImage(named: "user_inactive")!.imageResized(to: defaultIconSize)

let heartEmpty = UIImage(named: "heart_empty")?.imageResized(to: defaultIconSize)
let heartFilled = UIImage(named: "heart_filled")?.imageResized(to: defaultIconSize)

let arrowTriangle = UIImage(systemName: "arrowtriangle.forward.circle.fill")?.imageResized(to: biggerIconSize).withTintColor(greenColor)

let cuteBrain = UIImage(named: "CuteBrain")?.imageResized(to: biggestIconSize)
