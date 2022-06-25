//
//  MetaMaskDemoAccountInfo.swift
//  MetaMaskDemo
//
//  Created by dannyluo on 2022/6/24.
//

import UIKit

struct MetaMaskDemoAccountInfo: Codable {
    var id: String = ""
    var user_name: String = "Account 1"
    var avatar_url: String = ""
    var balance: String = "$0"
    var tokens: [MetaMaskDemoTokenInfo] = []
}
