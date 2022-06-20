//
//  AddAssetsView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/3.
//

import SwiftUI

struct AddAssetsView: View {
    @ObservedObject var viewModel: AccountViewModel
    var body: some View {
        TabView {
            ForEach(1..<2) { _ in
                SearchAssetsView(viewModel: viewModel)
                CustomAssetsView()
            }
        }
        .tabViewStyle(.page)
    }
}

struct AddAssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssetsView(viewModel: AccountViewModel())
    }
}
