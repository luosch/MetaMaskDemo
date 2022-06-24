//
//  MetaMaskDemoTokenView.swift
//  MetaMaskDemo
//
//  Created by Danny Luo on 2022/6/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MetaMaskDemoTokenView: View {

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(tokenItems) { item in
                    NavigationLink {
                        MetaMaskDemoReceiveView()
                    } label: {
                        HStack(spacing: 10) {
                            WebImage(url: URL(string: item.imageURL))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .cornerRadius(30)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("\(item.amount) \(item.name)")
                                    .foregroundColor(.black)
                                Text("\(item.totalPrice)")
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .padding(.all, 15)
                    }
                    
                    Divider()
                }
                
                VStack(spacing: 10) {
                    Text("Don't see your token?")
                    Button {
                        
                    } label: {
                        Text("Import Tokens")
                    }
                }.padding(.top, 15)
            }
        }.padding(.top, 35)
    }
    
}
