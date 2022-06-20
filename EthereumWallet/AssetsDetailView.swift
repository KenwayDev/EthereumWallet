//
//  AssetsDetailView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/3.
//

import SwiftUI

struct AssetsDetailView: View {
    var coin: AssetsCoin
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Spacer()
                AssetsDetailBriefView(coin: coin)
                Divider()
                Text("您没有交易!")
                    .font(.system(size: 36))
                    .padding(200)
                    .foregroundColor(.gray)
                    .frame(height: 50)
            }
        }
        .navigationTitle(coin.name)
    }
}

struct AssetsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsDetailView(coin: AssetsCoin(id: 123, name: "ETH", icon: "eth-logo", address: "0x21sdfe43w4342as"))
    }
}
