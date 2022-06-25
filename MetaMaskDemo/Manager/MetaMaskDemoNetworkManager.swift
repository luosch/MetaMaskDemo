//
//  MetaMaskDemoNetworkManager.swift
//  MetaMaskDemo
//
//  Created by dannyluo on 2022/6/24.
//

import UIKit

class MetaMaskDemoNetworkManager {

    let accountInfoURLString = "https://chinaeasy.net/api/account_info.json"
    
    static let shared = MetaMaskDemoNetworkManager()
    
    func fetchAccountInfo(_ completion: @escaping (MetaMaskDemoAccountInfo?) -> Void) {
        guard let url = URL(string: accountInfoURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("[MetaMaskDemoNetworkManager fetchAccountInfo] error: data is nil")
                completion(nil)
                return
            }
            
            do {
                let accountInfo = try JSONDecoder().decode(MetaMaskDemoAccountInfo.self, from: data)
                print("[MetaMaskDemoNetworkManager fetchAccountInfo] success: fetch account info")
                completion(accountInfo)
            } catch {
            }
        }.resume()
    }
    
    func fetchTokenInfo(tokenID: String, completion: @escaping (MetaMaskDemoTokenDetailInfo?) -> Void) {
        guard let url = URL(string: "https://chinaeasy.net/api/token_\(tokenID).json") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("[MetaMaskDemoNetworkManager fetchTokenInfo] error: data is nil")
                completion(nil)
                return
            }
            
            do {
                let detailInfo = try JSONDecoder().decode(MetaMaskDemoTokenDetailInfo.self, from: data)
                print("[MetaMaskDemoNetworkManager fetchTokenInfo] success: fetch account info")
                completion(detailInfo)
            } catch {
                print("[MetaMaskDemoNetworkManager fetchTokenInfo] error: json decode fail")
                completion(nil)
            }
        }.resume()
    }
    
}
