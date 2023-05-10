//
//  BankcardList.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/4/26.
//

import SwiftUI

struct BankcardList: View {
    @Binding var bankcards: [Bankcard]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewBankcardView = false
    let saveAction: ()->Void
    
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
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
    }
}

struct BankcardList_Previews: PreviewProvider {
    static var previews: some View {
        BankcardList(bankcards: .constant(SampleData().bankcards), saveAction: {})
    }
}
