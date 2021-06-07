//
//  TransactionsTableViewCell.swift
//  UBankiOS
//
//  Created by Karthi  S S on 7/6/21.
//  Copyright © 2021 Karthi  S S. All rights reserved.
//

import UIKit

class TransactionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var runningBalanceLabel: UILabel!
    
    var transactions : TransactionsData? {
        didSet {
            dateLabel.text = transactions?.date
            amountLabel.text = transactions?.amount
            descriptionLabel.text = transactions?.descriptionField
            runningBalanceLabel.text = transactions?.runningBalance
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
