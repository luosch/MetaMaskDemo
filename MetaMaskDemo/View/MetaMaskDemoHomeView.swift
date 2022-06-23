//
//  MetaMaskDemoHomeView.swift
//  MetaMaskDemo
//
//  Created by Danny Luo on 2022/6/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MetaMaskDemoHomeView: View {
    @State var selectedIndex = 0
    
    var body: some View {
        VStack {
            MetaMaskDemoHomeNavigationView()
            
            VStack(spacing: 15) {
                Button {
                    
                } label: {
                    WebImage(url: URL(string: "https://avatars.githubusercontent.com/u/6956493?v=4"))
                        .placeholder(Image("DefaultAvatar"))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(4)
                        .background(Circle().stroke(Color.blue, lineWidth: 2))
                }

                Text("Account 1")
                    .font(.title)
                
                Text("$0")
                    .font(Font.system(size: 14))
                    .foregroundColor(.gray)
                
                Text("0x47d5...78B3")
                    .font(Font.system(size: 14))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Capsule().fill(MetaMaskDemoConfig.ColorConfig.BackgroundColorA))
                
                HStack(spacing: 20) {
                    VStack {
                        Image("Receive").frame(width: 45, height: 45)
                        Text("Receive").foregroundColor(MetaMaskDemoConfig.ColorConfig.TextColorA)
                            .font(Font.system(size: 16))
                    }
                    
                    VStack {
                        Image("Buy").frame(width: 45, height: 45)
                        Text("Buy").foregroundColor(MetaMaskDemoConfig.ColorConfig.TextColorA)
                            .font(Font.system(size: 16))
                    }
                    
                    VStack {
                        Image("Send").frame(width: 45, height: 45)
                        Text("Send").foregroundColor(MetaMaskDemoConfig.ColorConfig.TextColorA)
                            .font(Font.system(size: 16))
                    }
                    
                    VStack {
                        Image("Swap").frame(width: 45, height: 45)
                        Text("Swap").foregroundColor(MetaMaskDemoConfig.ColorConfig.TextColorA)
                            .font(Font.system(size: 16))
                    }
                }
            }
            
            TabView(selection: $selectedIndex) {
                Text("Tokens").tag(0)
                MetaMaskDemoNFTView().tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .overlay(
                VStack(spacing: 1) {
                    HStack {
                        ForEach(0..<MetaMaskDemoConfig.TabItems.count) { i in
                            VStack {
                                Text(MetaMaskDemoConfig.TabItems[i].title)
                                    .foregroundColor(selectedIndex == i ? MetaMaskDemoConfig.ColorConfig.TextColorA : .gray)
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                if selectedIndex == i {
                                    Rectangle()
                                        .fill(MetaMaskDemoConfig.ColorConfig.TextColorA)
                                        .frame(height: 3)
                                } else {
                                    Rectangle()
                                        .fill(.clear)
                                        .frame(height: 3)
                                }
                            }.onTapGesture {
                                withAnimation {
                                    selectedIndex = i
                                }
                            }
                        }
                    }
                    Rectangle().fill(.gray.opacity(0.5)).frame(height: 1.5)
                },
                alignment: .top
            )
            .padding(.top)
            
            Spacer()
        }
    }
}

struct MetaMaskDemoHomeNavigationView: View {
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "line.horizontal.3")
                }
                
                Spacer()
                
                VStack(spacing: 2) {
                    Text("Wallet")
                        .font(Font.system(size: 16))
                    
                    HStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 8, height: 8)
                        
                        Text("Ethereum Main Network")
                            .font(Font.system(size: 12))
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "qrcode.viewfinder")
                }
            }.padding(.horizontal)
            
            Divider()
        }
    }
}

struct MetaMaskDemoHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MetaMaskDemoHomeView()
    }
}
