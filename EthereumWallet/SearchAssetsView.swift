//
//  SearchAssetsView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/3.
//

import SwiftUI

struct SearchAssetsView: View {
    @ObservedObject var viewModel: AccountViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var result: [AssetsCoin] = [AssetsCoin]()
    @State private var selectedCoin: AssetsCoin?
    var body: some View {
        List{
            Section(header: SearchAssetsHeaderView({ text in
                searchCoin(text)
            }), footer: SearchAssetsFooterView {
                if let coin = selectedCoin {
                    addCoin(coin)
                }
                presentationMode.wrappedValue.dismiss()
            } dismiss: {
                presentationMode.wrappedValue.dismiss()
            }) {
                ForEach(result) { coin in
                    AssetsSearchRowView(coin: coin).onTapGesture {
                        selectedCoin = coin
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .modifier(SearchListModifier())
    }
    
    func searchCoin(_ name: String) {
        let result = coinAssets.filter { coin in
            coin.name.contains(name)
        }
        self.result = result
    }
    
    func addCoin(_ coin: AssetsCoin) {
        var exist = false
        for item in viewModel.coins {
            if item.name == coin.name {
                exist = true
                break
            }
        }
        if !exist {
            viewModel.coins.append(coin)
        }
    }
}

struct SearchListModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .onAppear {
            UITableView.appearance().backgroundColor = .clear
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct SearchAssetsHeaderView: View {
    var inputText: (String)->Void
    @State var searchText: String = ""
    var body: some View {
        Text("新功能! 在以太坊主网上，已退出改进的代币检测作为实验性功能。从设置中启用它")
            .cornerRadius(5)
            .frame(height:60)
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            .background(Color.blue.opacity(0.1))
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.blue.opacity(0.5), lineWidth: 2))
        TextField("搜索代币", text: $searchText, onCommit: {
            inputText(searchText)
        })
            .frame(height:60)
            .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.blue.opacity(0.5), lineWidth: 2))
            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            
    }
    init(_ inputText: @escaping (String) -> Void) {
        self.inputText = inputText
    }
}

struct SearchAssetsFooterView: View {
    var dismiss: ()->Void
    var addCoin: ()->Void
    var body: some View {
        HStack {
            Button("取消"){
                dismiss()
            }
            .frame(width: 150, height: 60)
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.gray, lineWidth: 1))
            .foregroundColor(Color.gray)
            Spacer()
            Button("添加代币") {
                addCoin()
            }
            .frame(width: 150, height: 60)
            .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.blue, lineWidth: 1))
        }
    }
    
    init(_ addCoin: @escaping ()->Void, dismiss: @escaping ()->Void) {
        self.dismiss = dismiss
        self.addCoin = addCoin
    }
}

struct SearchAssetsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAssetsView(viewModel: AccountViewModel())
    }
}
