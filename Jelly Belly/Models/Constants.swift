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
    }
    
    enum DiscountTypes: Double {
        case defaultDiscount = 0.05
        case thanksgiving = 0.1
        case christmas = 0.15
        case newYear = 0.2
    }
}
