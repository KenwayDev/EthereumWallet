//
//  HomeView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/2.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                BriefHeaderView(icon: "eth-logo", name: "Account 2", detail: "0$", account: "0xffA659f5099D0B5Ba7B1A33Fa8c6085DaE174b2f")
                ScrollView(.horizontal) {
                    HStack {
                        AssetsListView()
                        NFTListView()
                    }
                    .frame(maxWidth:.infinity)
                    .background(Color.white)
                }
                
            }
            .navigationBarTitle("钱包")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Label("scan", systemImage: "camera")
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
