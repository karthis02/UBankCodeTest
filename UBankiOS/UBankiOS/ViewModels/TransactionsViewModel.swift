//
//  TransactionsViewModel.swift
//  UBankiOS
//
//  Created by Karthi  S S on 7/6/21.
//  Copyright © 2021 Karthi  S S. All rights reserved.
//

import UIKit

class TransactionsViewModel: NSObject {
    
    private var apiService : APIService!
    var accountData : AccountsData?
    private  var transactions: Transactions?
    
    private(set) var transactionsData : [TransactionsData]! {
        didSet {
            self.bindTransactionsViewModelToController()
        }
    }
    
    var bindTransactionsViewModelToController : (() -> ()) = {}
    
    init(accountData: AccountsData) {
        super.init()
        self.accountData = accountData
        self.apiService =  APIService()
        callFuncToGetTransactionsData()
    }
    
    func callFuncToGetTransactionsData() {
        let transationUrl = "https://www.ubank.com.au/content/dam/ubank/mobile/coding/transactions_\(accountData?.id ?? "").json"
        
        self.apiService.apiToGetTransactionsData (transactionUrl: transationUrl, completion: { (transactionData) in
            self.transactions = transactionData
            self.transactionsData = self.sortTransaction()
        })
    }
    
    func sortTransaction() -> [TransactionsData]? {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        df.locale = Locale(identifier: "en_US_POSIX")
        df.timeZone = TimeZone(identifier: "UTC")!
        let sortedTransactions =  self.transactions?.transactions?.sorted(by: {
            df.date(from:  $0.date ?? "")?.compare( df.date(from:  $1.date ?? "") ?? Date()) == .orderedDescending
        })
        return sortedTransactions
    }
}
