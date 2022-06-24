//
//  MetaMaskDemoTokenItem.swift
//  MetaMaskDemo
//
//  Created by Danny Luo on 2022/6/23.
//

import UIKit

struct MetaMaskDemoTokenItem: Identifiable {
    let id: String
    let imageURL: String
    let amount: Double
    let name: String
    let totalPrice: String
}

let tokenItems = [
    MetaMaskDemoTokenItem(id: "#ETH", imageURL: "https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png", amount: 500.0, name: "ETH", totalPrice: "$1023"),
    MetaMaskDemoTokenItem(id: "#AXS", imageURL: "https://s2.coinmarketcap.com/static/img/coins/64x64/6783.png", amount: 124, name: "AXS", totalPrice: "$123"),
    MetaMaskDemoTokenItem(id: "#FTM", imageURL: "https://s2.coinmarketcap.com/static/img/coins/64x64/3513.png", amount: 12, name: "FTM", totalPrice: "$123"),
    MetaMaskDemoTokenItem(id: "#WAVES", imageURL: "https://s2.coinmarketcap.com/static/img/coins/64x64/1274.png", amount: 12, name: "WAVES", totalPrice: "$123")
]
