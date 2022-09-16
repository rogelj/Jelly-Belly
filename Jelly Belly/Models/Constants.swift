//
//  Constants.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 19/08/2022.
//

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
}

let jellyColour = UIColor(red: CGFloat(183)/CGFloat(255), green: CGFloat(43)/CGFloat(255), blue: CGFloat(211)/CGFloat(255), alpha: 1)
let bellyColour = UIColor(red: CGFloat(87)/CGFloat(255), green: CGFloat(96)/CGFloat(255), blue: CGFloat(255)/CGFloat(255), alpha: 1)
