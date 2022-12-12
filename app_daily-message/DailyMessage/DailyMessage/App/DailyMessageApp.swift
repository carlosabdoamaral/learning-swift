//
//  DailyMessageApp.swift
//  DailyMessage
//
//  Created by Carlos Amaral on 17/01/22.
//

import SwiftUI

@main
struct DailyMessageApp: App {
    
    var network = Network()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
