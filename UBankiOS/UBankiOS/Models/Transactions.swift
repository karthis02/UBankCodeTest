//
//  Transactions.swift
//  UBankiOS
//
//  Created by Karthi  S S on 7/6/21.
//  Copyright © 2021 Karthi  S S. All rights reserved.
//

import Foundation

struct Transactions: Decodable {
     let transactions : [TransactionsData]?
     enum CodingKeys: String, CodingKey {
        case transactions = "transactions"
    }
}

// MARK: - Datum
struct TransactionsData : Codable {

let amount : String?
let date : String?
let descriptionField : String?
let processingStatus : String?
let runningBalance : String?

enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case date = "date"
        case descriptionField = "description"
        case processingStatus = "processingStatus"
        case runningBalance = "runningBalance"
    }
}
