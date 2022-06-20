//
//  AssetsListView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/4.
//

import SwiftUI

struct AssetsListView: View {
    @ObservedObject var viewModel: AccountViewModel = AccountViewModel()
    var body: some View {
        List{
            Section(footer:FooterView(viewModel: viewModel)) {
                ForEach($viewModel.coins, id: \.self) { $coin in
                    NavigationLink {
                        AssetsDetailView(coin:coin)
                    } label: {
                        AssetsRowView(coin: coin)
                    }
                }
            }
        }
        .environment(\.defaultMinListRowHeight, 60)
        .frame(width: UIScreen.main.bounds.size.width, height: CGFloat(60 * (viewModel.coins.count + 5)))
        .listStyle(.grouped)
    }
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().automaticallyAdjustsScrollIndicatorInsets = false
        UITableView.appearance().isScrollEnabled = false
    }
}

struct FooterView: View {
    @ObservedObject var viewModel: AccountViewModel
    var body: some View {
        VStack(alignment: .center) {
            Text("没有找到你的代币?")
                .padding(EdgeInsets(top: 5,leading: 0,bottom: 2,trailing: 0))
            NavigationLink {
                AddAssetsView(viewModel: viewModel)
            } label: {
                Text("添加代币")
                    .foregroundColor(.blue)
            }
        }
        .frame(width: UIScreen.main.bounds.size.width, height:60)
    }
}

struct AssetsListView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsListView()
    }
}
