//
//  MetaMaskDemoTokenDetailView.swift
//  MetaMaskDemo
//
//  Created by dannyluo on 2022/6/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MetaMaskDemoTokenDetailView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @State var detailInfo: MetaMaskDemoTokenDetailInfo = MetaMaskDemoTokenDetailInfo()
    var tokenID: String
    var tokenName: String
    @State private var isShowingLoadingView = true
    @State private var isShowingReceiveView = false
    
    var body: some View {
        VStack {
            if isShowingLoadingView {
                ProgressView()
            } else {
                VStack {
                    Button {
                        
                    } label: {
                        WebImage(url: URL(string: detailInfo.icon_url))
                            .placeholder(Image("DefaultAvatar"))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                    }

                    Text(detailInfo.name)
                        .font(.title)
                    
                    Text(detailInfo.balance)
                        .font(Font.system(size: 14))
                        .foregroundColor(.gray)
                    
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
                }.padding(.top, 20)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(detailInfo.transactions, id: \.id) { item in
                            HStack(spacing: 10) {
                                WebImage(url: URL(string: detailInfo.icon_url))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(30)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(item.dateString)
                                        .foregroundColor(.black)
                                        .font(Font.system(size: 14))
                                    
                                    Text(item.address)
                                        .font(Font.system(size: 14))
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 6)
                                        .frame(width: 150, height: 32)
                                        .truncationMode(.middle)
                                        .background(Capsule().fill(MetaMaskDemoConfig.ColorConfig.BackgroundColorA))
                                }
                                
                                Spacer()
                                
                                Text(item.amount)
                                    .foregroundColor(.black)
                            }
                            .padding(.all, 15)
                            
                            Divider()
                        }
                    }
                }.padding(.top, 35)
                
                Spacer()
            }
        }
        .navigationBarTitle(tokenName, displayMode: .inline)
        .onAppear {
            isShowingLoadingView = true
            
            MetaMaskDemoNetworkManager.shared.fetchTokenInfo(tokenID: tokenID) { detailInfo in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isShowingLoadingView = false
                }
                
                if let detailInfo = detailInfo {
                    self.detailInfo = detailInfo
                }
            }
        }
    }
}
