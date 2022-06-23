//
//  MetaMaskDemoNFTView.swift
//  MetaMaskDemo
//
//  Created by Danny Luo on 2022/6/23.
//

import SwiftUI

struct MetaMaskDemoNFTView: View {
    var body: some View {
        VStack(spacing: 10.0) {
            Image("NFT").frame(width: 100, height: 100)
            
            Text("No NFTs yet")
            
            Button {
                
            } label: {
                Text("Learn More")
            }
            
            Text("Don't see your NFT?")
            Button {
                
            } label: {
                Text("Import NFTs")
            }
        }
    }
}

struct MetaMaskDemoNFTView_Previews: PreviewProvider {
    static var previews: some View {
        MetaMaskDemoNFTView()
    }
}
