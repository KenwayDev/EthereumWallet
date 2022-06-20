//
//  Data.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/3.
//

import Foundation

let coinAssets: [AssetsCoin] = load("assets.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("找不到 \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("加载 \(filename) 失败:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("将\(filename) 解析为 \(T.self) 失败:\n\(error)")
    }
}
