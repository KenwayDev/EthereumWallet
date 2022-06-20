//
//  AssetsCoin.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/3.
//

import Foundation

struct AssetsCoin: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    var icon: String
    var address: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case address = "address"
        case icon = "icon"
    }
}


