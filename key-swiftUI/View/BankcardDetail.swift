//
//  BankcardDetail.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/5/6.
//

import SwiftUI

struct BankcardDetail: View {
    @EnvironmentObject var modelData: ModelData
    var bankcard: Bankcard
    
    var body: some View {
        List {
            Section(header: Text("银行卡信息")) {
                HStack {
                    Label("银行卡号", systemImage: "creditcard.and.123")
//                    Text("银行卡号")
                    Spacer()
                    Text("\(bankcard.id)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Label("卡类型", systemImage: "yensign.circle")
//                    Text("卡类型")
                    Spacer()
                    Text("\(bankcard.cardType)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Label("卡主", systemImage: "rectangle.inset.filled.and.person.filled")
//                    Text("卡主")
                    Spacer()
                    Text("\(bankcard.ownerName)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Label("有效期", systemImage: "clock.badge.checkmark")
//                    Text("有效期")
                    Spacer()
                    Text("\(bankcard.validThru)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Label("cvv2", systemImage: "key")
//                    Text("cvv2")
                    Spacer()
                    Text("\(bankcard.cvv2)")
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationTitle(bankcard.bankName)
    }
}

struct BankcardDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        BankcardDetail(bankcard: modelData.bankcards[0])
            .environmentObject(modelData)
    }
}
