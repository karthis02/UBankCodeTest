//
//  ViewController.swift
//  UBankiOS
//
//  Created by Karthi  S S on 5/6/21.
//  Copyright © 2021 Karthi  S S. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {
    
    
    @IBOutlet weak var accountsTableView: UITableView!
    
    private var accountsViewModel : AccountsViewModel!
    
    private var dataSource : AccountsTableViewDataSource<AccountsTableViewCell,AccountsData>!
    
    private var accountData : AccountsData?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableViewCell()
        callToViewModelForUIUpdate()
    }
    
    func configureTableViewCell() {
        accountsTableView.register(UINib(nibName: "AccountsTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountsTableViewCell")
    }
    
    func callToViewModelForUIUpdate(){
        
        self.accountsViewModel =  AccountsViewModel()
        self.accountsViewModel.bindAccountsViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = AccountsTableViewDataSource(cellIdentifier: "AccountsTableViewCell", items: self.accountsViewModel.accountsData.accounts!, configureCell: { (cell, avm) in
            cell.productNameLabel.text = avm.productName
            cell.availableBalanceLabel.text = avm.availableBalance
            cell.currentBalanceLabel.text = avm.currentBalance
        })
        self.dataSource.delegate = self
        DispatchQueue.main.async {
            self.accountsTableView.dataSource = self.dataSource
            self.accountsTableView.delegate = self.dataSource
            self.accountsTableView.reloadData()
        }
    }
    
}

//Delegate implementation
extension AccountsViewController: TransactionDelegate {
    func navigateToTransactionScreen(accountData: AccountsData?) {
        self.accountData = accountData
        self.performSegue(withIdentifier: "showTransactionView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let transactionsVC = segue.destination as? TransactionsViewController {
            transactionsVC.accountData = self.accountData
        }
    }
}
