//
//  ContentView.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/4/26.
//

import SwiftUI

struct ContentView: View {
    @Binding var bankcards: [Bankcard]
    let saveAction: ()->Void
    
    var body: some View {
        BankcardList(bankcards: $bankcards, saveAction: saveAction)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(bankcards: .constant(SampleData().bankcards), saveAction: {})
    }
}
