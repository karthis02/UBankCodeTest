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
    private(set) var transactionsData : Transactions! {
        didSet {
            self.bindTransactionsViewModelToController()
        }
    }
    
    var bindTransactionsViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetTransactionsData()
    }
    
    func callFuncToGetTransactionsData() {
        self.apiService.apiToGetTransactionsData { (transactionData) in
            self.transactionsData = transactionData
        }
    }
}
