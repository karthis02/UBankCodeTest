//
//  TransactionsViewControllerTests.swift
//  UBankiOSTests
//
//  Created by Karthi  S S on 9/6/21.
//  Copyright © 2021 Karthi  S S. All rights reserved.
//

import XCTest
@testable import UBankiOS

class TransactionsViewControllerTests: XCTestCase {
    
    var transactionsViewControllerTest: TransactionsViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.transactionsViewControllerTest = storyboard.instantiateViewController(withIdentifier: "TransactionsViewController") as? TransactionsViewController
        
        self.transactionsViewControllerTest.loadView()
        self.transactionsViewControllerTest.viewDidLoad()
    }
    
    func testViewModel() {
        let accountsViewModel = TransactionsViewModel(accountData: AccountsData(availableBalance: "101.70", currentBalance: "39.09", id: "12345", productName: "Savings"))
        XCTAssertNotNil(accountsViewModel, "The transactions view model should not be nil.")
    }
    
    func testSuccessFetchData() {
        
        let viewModel = TransactionsViewModel(accountData: AccountsData(availableBalance: "123.90", currentBalance: "-89.67", id: "65345", productName: "Current"))
        viewModel.bindTransactionsViewModelToController()
        XCTAssertTrue(!(viewModel.transactionsData != nil))
    }
    
    func testHasATableView() {
        XCTAssertNotNil(transactionsViewControllerTest.transactionsTableView)
    }

}
