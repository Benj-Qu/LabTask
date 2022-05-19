//
//  LabTaskApp.swift
//  LabTask
//
//  Created by Zhemin Qu on 5/17/22.
//

import SwiftUI

@main
struct LabTaskApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(DataStore())
                .environmentObject(IfText())
                .preferredColorScheme(.dark)
        }
    }
}
