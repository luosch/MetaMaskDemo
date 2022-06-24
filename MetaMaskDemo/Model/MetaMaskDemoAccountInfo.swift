//
//  MetaMaskDemoAccountInfo.swift
//  MetaMaskDemo
//
//  Created by dannyluo on 2022/6/24.
//

import UIKit

struct MetaMaskDemoAccountInfo: Codable {
    var id: String
    var user_name: String
    var avatar_url: String
    var balance: String
    var tokens: [MetaMaskDemoTokenInfo]
    
    static let `default` = MetaMaskDemoAccountInfo(id: "",
                                                   user_name: "Account 1",
                                                   avatar_url: "",
                                                   balance: "$0",
                                                   tokens: [])
}
