//
//  key_swiftUIApp.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/4/26.
//

import SwiftUI

@main
struct key_swiftUIApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(bankcards: $modelData.bankcards)
        }
    }
}
