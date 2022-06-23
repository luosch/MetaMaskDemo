//
//  MetaMaskDemoConfig.swift
//  MetaMaskDemo
//
//  Created by Danny Luo on 2022/6/23.
//

import UIKit
import SwiftUI

struct MenuItem {
    let imageName: String
    let title: String
}

struct MetaMaskDemoConfig {

    static let TabItems = [
        MetaMaskDemoTabItem(id: "Token", title: "TOKENS"),
        MetaMaskDemoTabItem(id: "NFT", title: "NFTs"),
    ]
    
    struct MenuConfig {
        static let MenuList: [MenuItem] = [
            MenuItem(imageName: "Receive", title: "Receive"),
            MenuItem(imageName: "Buy", title: "Buy"),
            MenuItem(imageName: "Send", title: "Send"),
            MenuItem(imageName: "Swap", title: "Swap")
        ]
    }
    
    struct ColorConfig {
        static let BackgroundColorA = Color(red: 232.0/255.0, green: 241.0/255.0, blue: 250.0/255.0)
        
        static let TextColorA = Color(red: 54.0/255.0, green: 124.0/255.0, blue: 201.0/255.0)
    }
    
}
