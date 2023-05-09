//
//  Bankcard.swift
//  key-swiftUI
//
//  Created by MissYasiky on 2023/4/26.
//

import Foundation

struct Bankcard: Identifiable, Codable {
    var id: String
    var bankName: String
    var isCreditCard: Bool
    var isMyOwn: Bool
    var validThru: String
    var cvv2: String
    
    var cardType: String {
        self.isCreditCard ? "信用卡" : "借记卡"
    }
    
    var ownerName: String {
        self.isMyOwn ? "XieYunJia" : ""
    }
    
    init(id: String, bankName: String, isCreditCard: Bool = false, isMyOwn: Bool = true, validThru: String, cvv2: String) {
        self.id = id
        self.bankName = bankName
        self.isCreditCard = isCreditCard
        self.isMyOwn = isMyOwn
        self.validThru = validThru
        self.cvv2 = cvv2
    }
}

extension Bankcard {
    static var emptyBankcard: Bankcard {
        Bankcard(id: "", bankName: "", validThru: "", cvv2: "")
    }
}
