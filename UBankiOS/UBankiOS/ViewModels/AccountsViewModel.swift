//
//  AccountsViewModel.swift
//  UBankiOS
//
//  Created by Karthi  S S on 7/6/21.
//  Copyright © 2021 Karthi  S S. All rights reserved.
//

import UIKit

class AccountsViewModel: NSObject {
    
    private var apiService : APIService!
    private(set) var accountsData : Accounts! {
        didSet {
            self.bindAccountsViewModelToController()
        }
    }
    
    var bindAccountsViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetAccountsData()
    }
    
    func callFuncToGetAccountsData() {
        self.apiService.apiToGetAccountsData { (accountsData) in
            self.accountsData = accountsData
        }
    }
}
