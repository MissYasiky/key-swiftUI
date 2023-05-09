//
//  BankcardEdit.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/5/6.
//

import SwiftUI

struct BankcardEdit: View {
    @Binding var bankcard: Bankcard
    
    var body: some View {
        List {
            Section(header: Text("银行卡信息")) {
                HStack {
                    Label("", systemImage: "banknote")
                    TextField("银行名称", text: $bankcard.bankName)
                }
                HStack {
                    Label("", systemImage: "creditcard.and.123")
                    TextField("银行卡号", text: $bankcard.id)
                }
                HStack {
                    Toggle(isOn: $bankcard.isCreditCard) {
                        Label(" 信用卡", systemImage: "yensign.circle")
                    }
                }
                HStack {
                    Toggle(isOn: $bankcard.isMyOwn) {
                        Label(" 本人持有", systemImage: "rectangle.inset.filled.and.person.filled")
                    }
                }
                HStack {
                    Label("", systemImage: "clock.badge.checkmark")
                    TextField("有效期", text: $bankcard.validThru)
                }
                HStack {
                    Label("", systemImage: "key")
                    TextField("cvv2", text: $bankcard.cvv2)
                }
            }
        }
    }
}

struct BankcardEdit_Previews: PreviewProvider {
    static var previews: some View {
        BankcardEdit(bankcard: .constant(ModelData().bankcards[0]))
    }
}
