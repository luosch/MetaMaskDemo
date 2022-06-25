//
//  MetaMaskDemoTransactionInfo.swift
//  MetaMaskDemo
//
//  Created by Danny Luo on 2022/6/25.
//

import UIKit

struct MetaMaskDemoTransactionInfo: Codable {
    let id: String
    let timestamp: TimeInterval
    let amount: String
    let address: String
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: Date(timeIntervalSince1970: timestamp))
    }
    
}
