//
//  FileManager.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 14/10/2022.
//

import Foundation

public extension FileManager {
    static var documentsDirectoryURL: URL {
        return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}

