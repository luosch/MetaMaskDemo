//
//  MetaMaskDemoTokenDetailView.swift
//  MetaMaskDemo
//
//  Created by dannyluo on 2022/6/24.
//

import SwiftUI

struct MetaMaskDemoTokenDetailView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    var tokenID: String
    var tokenName: String
    @State private var isShowingLoadingView = true
    
    var body: some View {
        VStack {
            if isShowingLoadingView {
                ProgressView()
            }
        }
        .navigationBarTitle(tokenName, displayMode: .inline)
        .onAppear {
            isShowingLoadingView = true
        }
    }
}
