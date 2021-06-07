//
//  Accounts.swift
//  UBankiOS
//
//  Created by Karthi  S S on 7/6/21.
//  Copyright © 2021 Karthi  S S. All rights reserved.
//

import Foundation


struct Accounts: Decodable {
    let accounts : [AccountsData]?
}

struct AccountsData : Codable {

let availableBalance : String?
let currentBalance : String?
let id : String?
let productName : String?

enum CodingKeys: String, CodingKey {
        case availableBalance = "availableBalance"
        case currentBalance = "currentBalance"
        case id = "id"
        case productName = "productName"
    }
}
