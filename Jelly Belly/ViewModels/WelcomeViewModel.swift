//
//  WelcomeViewModel.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 23/09/2022.
//

import SwiftUI

/**
 Greeting generates a welcoming message for the user name provided.
 It takes into account the orientation of the device.
 */
func greeting(userName: String) -> String {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    if verticalSizeClass == .regular && horizontalSizeClass == .compact {
        return "Welcome to\n\(userName)"
    } else {
        return "Welcome to \(userName)"
 
    }
}
