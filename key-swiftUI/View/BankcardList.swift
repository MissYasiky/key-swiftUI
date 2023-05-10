//
//  BankcardList.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/4/26.
//

import SwiftUI

struct BankcardList: View {
    @Binding var bankcards: [Bankcard]
    @State private var isPresentingNewBankcardView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array($bankcards.enumerated()), id:\.element.id) { (index, $bankcard) in
                    NavigationLink {
                        BankcardDetail(bankcard: $bankcard)
                    } label: {
                        BankcardRow(bankcard: bankcard)
                            .swipeActions {
                                Button("删除", role: .destructive) {
                                    bankcards.remove(at: index)
                                }
                            }
                    }
                }
            }
            .navigationTitle("银行卡")
            .toolbar {
                Button(action: {
                    isPresentingNewBankcardView = true
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isPresentingNewBankcardView) {
                NewBankcard(bankcards: $bankcards, isPresentingNewBankcardView: $isPresentingNewBankcardView)
            }
        }
    }
}

struct BankcardList_Previews: PreviewProvider {
    static var previews: some View {
        BankcardList(bankcards: .constant(ModelData().bankcards))
    }
}
