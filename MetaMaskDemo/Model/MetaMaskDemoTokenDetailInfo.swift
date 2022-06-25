//
//  MetaMaskDemoTokenDetailInfo.swift
//  MetaMaskDemo
//
//  Created by Danny Luo on 2022/6/25.
//

import UIKit

struct MetaMaskDemoTokenDetailInfo: Codable {
    var id: String = ""
    var icon_url: String = ""
    var name: String = ""
    var amount: String = ""
    var balance: String = ""
    
    var transactions: [MetaMaskDemoTransactionInfo] = []
}
