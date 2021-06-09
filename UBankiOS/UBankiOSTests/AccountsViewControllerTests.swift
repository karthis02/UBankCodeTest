//
//  AccountsViewControllerTests.swift
//  UBankiOSTests
//
//  Created by Karthi  S S on 9/6/21.
//  Copyright © 2021 Karthi  S S. All rights reserved.
//

import XCTest
@testable import UBankiOS

class AccountsViewControllerTests: XCTestCase {
    
    var accountsViewControllerTest: AccountsViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.accountsViewControllerTest = storyboard.instantiateViewController(withIdentifier: "AccountsViewController") as? AccountsViewController
        
        self.accountsViewControllerTest.loadView()
        self.accountsViewControllerTest.viewDidLoad()
    }
    
    func testViewModel() {
           let accountsViewModel = AccountsViewModel()
           XCTAssertNotNil(accountsViewModel, "The account view model should not be nil.")
    }
       
    func testSuccessFetchData() {
           
        let viewModel = AccountsViewModel()
        viewModel.bindAccountsViewModelToController()
        XCTAssertTrue(!(viewModel.accountsData != nil))
    }
    
    func testHasATableView() {
        XCTAssertNotNil(accountsViewControllerTest.accountsTableView)
    }
    


}
