//
//  BankcardList.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/4/26.
//

import SwiftUI

struct BankcardList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BankcardList_Previews: PreviewProvider {
    static var previews: some View {
        BankcardList()
            .environmentObject(ModelData())
    }
}
