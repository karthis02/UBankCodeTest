//
//  APIService.swift
//  UBankiOS
//
//  Created by Karthi  S S on 7/6/21.
//  Copyright © 2021 Karthi  S S. All rights reserved.
//

import UIKit

class APIService: NSObject {
    
    private let accountsURL = URL(string: "https://www.ubank.com.au/content/dam/ubank/mobile/coding/accounts.json")!
 
    func apiToGetAccountsData(completion : @escaping (Accounts) -> ()){
        
        URLSession.shared.dataTask(with: accountsURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(Accounts.self, from: data)
                
                completion(empData)
            }
            
        }.resume()
    }
    
    func apiToGetTransactionsData(transactionUrl: String?, completion : @escaping (Transactions) -> ()) {
        
        let convertedUrl = URL(string:transactionUrl ?? "")!
        
        URLSession.shared.dataTask(with: convertedUrl) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(Transactions.self, from: data)
                
                completion(empData)
            }
            
        }.resume()
    }
}
