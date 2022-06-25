//
//  MetaMaskDemoHomeView.swift
//  MetaMaskDemo
//
//  Created by Danny Luo on 2022/6/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct MetaMaskDemoHomeView: View {
    
//    @StateObject private var networkManager = MetaMaskDemoNetworkManager()
    @State private var accountInfo: MetaMaskDemoAccountInfo = MetaMaskDemoAccountInfo()
    @State private var selectedIndex = 0
    @State private var isShowingReceiveView = false
    @State private var isShowingLoadingView = true
    
    var body: some View {
        NavigationView {
            VStack {
                if isShowingLoadingView {
                    ProgressView("")
                }
                MetaMaskDemoHomeNavigationView()
                
                VStack(spacing: 5) {
                    Button {
                        
                    } label: {
                        WebImage(url: URL(string: accountInfo.avatar_url))
                            .placeholder(Image("DefaultAvatar"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .padding(4)
                            .background(Circle().stroke(Color.blue, lineWidth: 2))
                    }

                    Text(accountInfo.user_name)
                        .font(.title)
                    
                    Text(accountInfo.balance)
                        .font(Font.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Text(accountInfo.id)
                        .font(Font.system(size: 14))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 6)
                        .frame(width: 150, height: 32)
                        .truncationMode(.middle)
                        .background(Capsule().fill(MetaMaskDemoConfig.ColorConfig.BackgroundColorA))
                    
                    HStack(spacing: 30) {
                        ForEach(MetaMaskDemoConfig.MenuItems) { item in
                            Button {
                                if item.id == "#Receive" {
                                    isShowingReceiveView.toggle()
                                }
                            } label: {
                                VStack {
                                    Image(item.imageName).frame(width: 40, height: 40)
                                    Text(item.title).foregroundColor(MetaMaskDemoConfig.ColorConfig.TextColorA)
                                        .font(Font.system(size: 16))
                                }
                            }.sheet(isPresented: $isShowingReceiveView) {
                                MetaMaskDemoReceiveView()
                            }
                        }
                    }.padding(.top, 10)
                }
                
                TabView(selection: $selectedIndex) {
                    MetaMaskDemoTokenView(tokens: accountInfo.tokens).tag(0)
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
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }.onAppear() {
            isShowingLoadingView = true
            
            MetaMaskDemoNetworkManager.shared.fetchAccountInfo { accountInfo in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isShowingLoadingView = false
                }
                
                if let accountInfo = accountInfo {
                    self.accountInfo = accountInfo
                }
            }
        }
    }
}

struct MetaMaskDemoHomeNavigationView: View {
    var body: some View {
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
        }
        .padding(.horizontal)
        
        Divider()
    }
}

struct MetaMaskDemoHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MetaMaskDemoHomeView()
    }
}
