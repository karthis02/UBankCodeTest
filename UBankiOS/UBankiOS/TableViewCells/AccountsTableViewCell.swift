//
//  AccountsTableViewCell.swift
//  UBankiOS
//
//  Created by Karthi  S S on 7/6/21.
//  Copyright © 2021 Karthi  S S. All rights reserved.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var availableBalanceLabel: UILabel!
    @IBOutlet weak var currentBalanceLabel: UILabel!
    
    var accounts : AccountsData? {
        didSet {
            productNameLabel.text = accounts?.productName
            availableBalanceLabel.text = accounts?.availableBalance
            currentBalanceLabel.text = accounts?.currentBalance
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
