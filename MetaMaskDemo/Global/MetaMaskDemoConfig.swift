//
//  MetaMaskDemoConfig.swift
//  MetaMaskDemo
//
//  Created by Danny Luo on 2022/6/23.
//

import UIKit
import SwiftUI


struct MetaMaskDemoConfig {

    static let TabItems = [
        MetaMaskDemoTabItem(id: "#Token", title: "TOKENS"),
        MetaMaskDemoTabItem(id: "#NFT", title: "NFTs"),
    ]
    
    static let MenuItems = [
        MetaMaskDemoMenuItem(id: "#Receive", title: "Receive", imageName: "Receive"),
        MetaMaskDemoMenuItem(id: "#Buy", title: "Buy", imageName: "Buy"),
        MetaMaskDemoMenuItem(id: "#Send", title: "Send", imageName: "Send"),
        MetaMaskDemoMenuItem(id: "#Swap", title: "Swap", imageName: "Swap")
    ]
    
    struct MenuConfig {
        
    }
    
    struct ColorConfig {
        static let BackgroundColorA = Color(red: 232.0/255.0, green: 241.0/255.0, blue: 250.0/255.0)
        
        static let TextColorA = Color(red: 54.0/255.0, green: 124.0/255.0, blue: 201.0/255.0)
    }
    
}
