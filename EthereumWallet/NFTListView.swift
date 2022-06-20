//
//  NFTListView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/4.
//

import SwiftUI

struct NFTListView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("eth-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 40, style: .continuous).stroke(Color.black, lineWidth: 4))
            Text("尚无NFT")
                .font(.system(size: 36))
                .padding(EdgeInsets(top: 5,leading: 0,bottom: 2,trailing: 0))
            
            Button("了解更多") {
                
            }
            .font(.system(size: 14))
            Spacer()
            Text("您没有任何收藏品")
                .padding(EdgeInsets(top: 5,leading: 0,bottom: 2,trailing: 0))
            NavigationLink {
                AddNFTView()
            } label: {
                Text("添加收藏品")
                    .font(.system(size: 14))
                    .foregroundColor(.blue)
            }
            Spacer()
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.size.width)
    }
}

struct NFTListView_Previews: PreviewProvider {
    static var previews: some View {
        NFTListView()
    }
}
