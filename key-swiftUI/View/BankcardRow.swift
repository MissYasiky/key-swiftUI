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
                Text(bankcard.bankName)
                    .font(.headline)
                Spacer()
                HStack {
                    Label(bankcard.id, systemImage: "creditcard.and.123")
                        .font(.caption)
                    Spacer()
                    Text(bankcard.cardType)
                        .font(.caption2)
                }
            }
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
