//
//  NewBankcard.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/5/9.
//

import SwiftUI

struct NewBankcard: View {
    @State private var newBankcard = Bankcard.emptyBankcard
    @Binding var bankcards: [Bankcard]
    @Binding var isPresentingNewBankcardView: Bool
    
    var body: some View {
        NavigationView {
            BankcardEdit(bankcard: $newBankcard)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("取消") {
                            isPresentingNewBankcardView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("新增") {
                            bankcards.append(newBankcard)
                            isPresentingNewBankcardView = false
                        }
                    }
                }
        }
    }
}

struct NewBankcard_Previews: PreviewProvider {
    static var previews: some View {
        NewBankcard(bankcards: .constant(ModelData().bankcards), isPresentingNewBankcardView: .constant(true))
    }
}
