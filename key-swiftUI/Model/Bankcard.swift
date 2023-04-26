//
//  Bankcard.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/4/26.
//

import Foundation

struct Bankcard: Identifiable, Codable {
    let id: String
    var bankName: String
    var isCreditCard: Bool
    var isMyOwn: Bool
    var validThru: String
    var cvv2: String
    
    init(id: String, bankName: String, isCreditCard: Bool = false, isMyOwn: Bool = true, validThru: String, cvv2: String) {
        self.id = id
        self.bankName = bankName
        self.isCreditCard = isCreditCard
        self.isMyOwn = isMyOwn
        self.validThru = validThru
        self.cvv2 = cvv2
    }
}
