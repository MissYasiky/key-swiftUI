//
//  BankcardDetail.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/5/6.
//

import SwiftUI

struct BankcardDetail: View {
    @State private var editingBankcard = Bankcard.emptyBankcard
    @State private var isPresentingEditView = false
    
    @Binding var bankcard: Bankcard
    
    var body: some View {
        List {
            Section(header: Text("银行卡信息")) {
                HStack {
                    Label("银行卡号", systemImage: "creditcard.and.123")
                    Spacer()
                    Text("\(bankcard.id)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Label("卡类型", systemImage: "yensign.circle")
                    Spacer()
                    Text("\(bankcard.cardType)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Label("卡主", systemImage: "rectangle.inset.filled.and.person.filled")
                    Spacer()
                    Text("\(bankcard.ownerName)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Label("有效期", systemImage: "clock.badge.checkmark")
                    Spacer()
                    Text("\(bankcard.validThru)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Label("cvv2", systemImage: "key")
                    Spacer()
                    Text("\(bankcard.cvv2)")
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle(bankcard.bankName)
        .toolbar {
            Button("编辑") {
                isPresentingEditView = true
                editingBankcard = bankcard
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                BankcardEdit(bankcard: $editingBankcard)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("取消") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("完成") {
                                isPresentingEditView = false
                                bankcard = editingBankcard
                            }
                        }
                    }
            }
        }
    }
}

struct BankcardDetail_Previews: PreviewProvider {
    static var previews: some View {
        BankcardDetail(bankcard: .constant(SampleData().bankcards[0]))
    }
}
