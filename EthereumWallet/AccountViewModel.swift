//
//  AccountViewModel.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/4.
//

import Foundation
import SwiftUI


class AccountViewModel: ObservableObject {
    @Published var coins: [AssetsCoin] =  [AssetsCoin(id: 12345, name: "ETH", icon: "eth-logo", address: "0x75231f58b43240c9718dd58b4967c5114342a223")]
}
