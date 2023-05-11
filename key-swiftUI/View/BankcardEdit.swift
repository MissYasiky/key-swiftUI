//
//  BankcardEdit.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/5/6.
//

import SwiftUI

struct BankcardEdit: View {
    @Binding var bankcard: Bankcard
    @FocusState private var valueFieldIsFocused: Bool
    @State private var newKey = ""
    @State private var newValue = ""
    
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
                        .keyboardType(.numberPad)
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
                        .keyboardType(.numberPad)
                }
                HStack {
                    Label("", systemImage: "key")
                    TextField("cvv2", text: $bankcard.cvv2)
                        .keyboardType(.numberPad)
                }
            }
            Section(header: Text("更多信息")) {
                ForEach(Array(bankcard.extraInfo.keys), id: \.self) { key in
                    HStack {
                        Text(key)
                            .frame(width: 100, alignment: .leading)
                        Divider()
                        Text(bankcard.extraInfo[key]!)
                    }
                    .swipeActions {
                        Button("删除", role: .destructive) {
                            bankcard.extraInfo.removeValue(forKey: key)
                        }
                    }
                }
                HStack {
                    TextField("自定义标签", text: $newKey)
                        .frame(width: 100)
                        .submitLabel(.continue)
                    Divider()
                    TextField("信息内容", text: $newValue)
                        .focused($valueFieldIsFocused)
                        .submitLabel(.done)
                    Button(action: {
                        bankcard.extraInfo[newKey] = newValue
                        newKey = ""
                        newValue = ""
                        valueFieldIsFocused = false
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newValue.isEmpty || newKey.isEmpty)
                }
            }
        }
    }
}

struct BankcardEdit_Previews: PreviewProvider {
    static var previews: some View {
        BankcardEdit(bankcard: .constant(SampleData().bankcards[0]))
    }
}
