//
//  MetaMaskDemoReceiveView.swift
//  MetaMaskDemo
//
//  Created by Danny Luo on 2022/6/23.
//

import SwiftUI

struct MetaMaskDemoReceiveView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Receive")
            
            Image("QRCode").resizable().scaledToFit().frame(width: 200, height: 200)
            
            Text("Scan address to receive payment")
            
            Text("0x47d5...78B3")
                .font(Font.system(size: 14))
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
                .background(Capsule().fill(MetaMaskDemoConfig.ColorConfig.BackgroundColorA))
            
            HStack {
                Button {
                    
                } label: {
                    Text("Buy ETH")
                        .foregroundColor(.white)
                        .bold()
                }
                .frame(width: (UIScreen.main.bounds.width - 16*2 - 44) / 2, height: 44)
                .background(MetaMaskDemoConfig.ColorConfig.TextColorA)
                .cornerRadius(22)
                
                Button {
                    
                } label: {
                    Text("Request Payment")
                        .foregroundColor(MetaMaskDemoConfig.ColorConfig.TextColorA)
                        .bold()
                }
                .frame(width: (UIScreen.main.bounds.width - 16*2 - 44) / 2, height: 44)
            }.padding(.horizontal, 16)
        }
    }
}
