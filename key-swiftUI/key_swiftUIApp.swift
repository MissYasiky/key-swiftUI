//
//  key_swiftUIApp.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/4/26.
//

import SwiftUI

@main
struct key_swiftUIApp: App {
    @StateObject private var store = DataStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ContentView(bankcards: $store.bankcards) {
                Task {
                    do {
                        try await store.saveBankcard(bankcards: store.bankcards)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "数据保存失败！")
                    }
                }
            }
            .task {
                do {
                    try await store.loadBankcard()
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "数据加载失败！")
                }
            }
            .sheet(item: $errorWrapper) { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
