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
}
