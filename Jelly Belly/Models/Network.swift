//
//  Network.swift
//  Jelly Belly
//
//  Created by J Rogel PhD on 27/10/2022.
//

import Foundation
import SwiftUI
import Network

class Network: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    @Published private(set) var connected: Bool = false

    private var isConnected: Bool = false

    init() {
        monitor.start(queue: queue)

        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                OperationQueue.main.addOperation {
                    self.isConnected = true
                    self.connected = self.isConnected
                }
            } else {
                OperationQueue.main.addOperation {
                    self.isConnected = false
                    self.connected = self.isConnected
                }            }
        }
    }
    
}
