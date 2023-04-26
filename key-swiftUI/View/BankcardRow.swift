//
//  BankcardRow.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/4/26.
//

import SwiftUI

struct BankcardRow: View {
    let bankcard: Bankcard
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Label(bankcard.bankName, systemImage: "creditcard")
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
                Text(bankcard.id)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(bankcard.isCreditCard ? "信用卡" : "借记卡")
                .font(.footnote)
        }
        .padding(10)
    }
}

struct BankcardRow_Previews: PreviewProvider {
    static var bankcard = Bankcard(id: "1111111111", bankName: "工商银行", validThru: "0921", cvv2: "123")
    
    static var previews: some View {
        BankcardRow(bankcard: bankcard)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
