//
//  ContentView.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/4/26.
//

import SwiftUI

struct ContentView: View {
    @Binding var bankcards: [Bankcard]
    
    var body: some View {
        BankcardList(bankcards: $bankcards)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(bankcards: .constant(ModelData().bankcards))
    }
}
