//
//  AssetsRowView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/3.
//

import SwiftUI

struct AssetsRowView: View {
    var coin: AssetsCoin
    @State private var icon: UIImage?
    var body: some View {
        HStack {
            if coin.icon.hasPrefix("http") {
                Image(uiImage: icon ?? UIImage(named: "eth-logo")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .onAppear(perform: getIcon)
            } else {
                Image(coin.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
            VStack(alignment:.leading) {
                Text("0 \(coin.name)")
                    .font(.system(size: 16))
                Text("$0")
                    .foregroundColor(Color.gray)
            }
        }
        .frame(height: 60)
    }
    
    func getIcon() {
        guard let url = URL(string: coin.icon) else { return }
        URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let image = UIImage(data: data!){
                self.icon = image
            }
        }.resume()
    }
}

struct AssetsRowView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsRowView(coin: AssetsCoin(id: 493, name: "HT", icon:"eth-logo", address: "0x6f259637dcd74c767781e37bc6133cd6a68aa161"))
    }
}
