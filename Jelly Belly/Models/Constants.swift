//
//  Constants.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

// This folder contains constants that are used throughout the app

import Foundation
import UIKit

enum Constants {
    enum General {
        public static let currentSeason = Constants.DiscountTypes.thanksgiving
        public static let strokeWidth: CGFloat = 2.0
        public static let roundedViewLength: CGFloat = 56.0
        public static let roudedRectCornerRadius: CGFloat = 21.0
    }
    
    enum Logo {
        public static let logoViewSize: CGFloat = 100.0
        public static let logoViewSizeSmall: CGFloat = 75.0
        public static let logoViewSizeTiny: CGFloat = 40.0
    }
    
    enum DiscountTypes: Double {
        case defaultDiscount = 0.05
        case thanksgiving = 0.1
        case christmas = 0.15
        case newYear = 0.2
    }

    enum Animation {
        public static let eLineWidth: CGFloat = 4
        public static let uZoomFactor: CGFloat = 1.4
        public static let lineWidth:  CGFloat = 50
        public static let lineHeight: CGFloat = 4
        public static let eCircleRadius: CGFloat = 10
    }
}

let jellyColour = UIColor(red: CGFloat(183)/CGFloat(255), green: CGFloat(43)/CGFloat(255), blue: CGFloat(211)/CGFloat(255), alpha: 1)
let bellyColour = UIColor(red: CGFloat(87)/CGFloat(255), green: CGFloat(96)/CGFloat(255), blue: CGFloat(255)/CGFloat(255), alpha: 1)

// Used in the welcome view
let userNameJB = "Jelly Belly"

// Used in the OnboardView
let featuresToBuild = ["The app shows a menu as a list",
                   "Menu list is fetched from an API and saved in the app",
                   "Users can choose menu items and add them to their order",
                   "Upon placing an order, users can select or add a tip",
                   "Upon checkout, total amount will be calculated",
                   "Users can write a review of the menu item and add a photo of the dish"]

extension Double {
    func roundNearest() -> Double {
        let intPart: Int = Int(self)
        let decimalPart: Double = self - Double(intPart)
        if decimalPart >= 0.5 {
            return Double(intPart) + 1.0
        } else {
            return Double(intPart)
        }
    }
}
