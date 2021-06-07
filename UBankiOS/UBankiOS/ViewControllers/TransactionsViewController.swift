//
//  TransactionsViewController.swift
//  UBankiOS
//
//  Created by Karthi  S S on 7/6/21.
//  Copyright © 2021 Karthi  S S. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    
    @IBOutlet weak var transactionsTableView: UITableView!
    
    private var transactionsViewModel : TransactionsViewModel!
    
    private var dataSource : TransactionsTableViewDataSource<TransactionsTableViewCell,TransactionsData>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableViewCell()
        callToViewModelForUIUpdate()
    }
    
    func configureTableViewCell() {
        transactionsTableView.register(UINib(nibName: "TransactionsTableViewCell", bundle: nil), forCellReuseIdentifier: "TransactionsTableViewCell")
              
    }
    
    func callToViewModelForUIUpdate(){
        
        self.transactionsViewModel =  TransactionsViewModel()
        self.transactionsViewModel.bindTransactionsViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        
        self.dataSource = TransactionsTableViewDataSource(cellIdentifier: "TransactionsTableViewCell", items: self.transactionsViewModel.transactionsData.transactions!, configureCell: { (cell, tvm) in
            cell.descriptionLabel.text = tvm.descriptionField
            cell.amountLabel.text = tvm.amount
            cell.runningBalanceLabel.text = tvm.runningBalance
        })
        
        DispatchQueue.main.async {
            self.transactionsTableView.dataSource = self.dataSource
            self.transactionsTableView.reloadData()
        }
    }
    
}
