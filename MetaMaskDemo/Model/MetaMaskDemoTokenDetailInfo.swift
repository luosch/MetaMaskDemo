//
//  MetaMaskDemoTokenDetailInfo.swift
//  MetaMaskDemo
//
//  Created by Danny Luo on 2022/6/25.
//

import UIKit

struct MetaMaskDemoTokenDetailInfo: Codable {
    let id: String
    let icon_url: String
    let name: String
    let amount: String
    let balance: String
    
    let transactions: [MetaMaskDemoTransactionInfo]
}
