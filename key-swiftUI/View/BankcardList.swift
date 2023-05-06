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
        NavigationView {
            List {
                ForEach(modelData.bankcards) { bankcard in
                    NavigationLink {
                        BankcardDetail(bankcard: bankcard)
                    } label: {
                        BankcardRow(bankcard: bankcard)
                    }
                }
            }
            .navigationTitle("银行卡")
        }
    }
}

struct BankcardList_Previews: PreviewProvider {
    static var previews: some View {
        BankcardList()
            .environmentObject(ModelData())
    }
}
