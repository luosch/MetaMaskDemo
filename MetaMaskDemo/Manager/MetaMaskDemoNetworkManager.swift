//
//  MetaMaskDemoNetworkManager.swift
//  MetaMaskDemo
//
//  Created by dannyluo on 2022/6/24.
//

import UIKit

class MetaMaskDemoNetworkManager: NSObject {

    let accountInfoURLString = "https://chinaeasy.net/api/account_info.json"
    
    static let shared = MetaMaskDemoNetworkManager()
    
    private override init() {
        
    }
    
    func fetchAccountInfo(_ completion: @escaping (MetaMaskDemoAccountInfo?) -> Void) {
        guard let url = URL(string: accountInfoURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("[MetaMaskDemoNetworkManager] error: data is nil")
                completion(nil)
                return
            }
            
            do {
                let accountInfo = try JSONDecoder().decode(MetaMaskDemoAccountInfo.self, from: data)
                print("[MetaMaskDemoNetworkManager] success: fetch account info")
                completion(accountInfo)
            } catch {
            }
        }.resume()
    }
    
}
