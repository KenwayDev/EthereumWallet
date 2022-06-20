//
//  AddNFTView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/3.
//

import SwiftUI

struct AddNFTView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var address: String = ""
    @State var idStr: String = ""
    var body: some View {
        List{
            Section(header:Text("地址")) {
                TextField("0x...", text: $address)
                    .frame(height:60)
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.gray.opacity(0.5), lineWidth: 1))
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    
            }
            Spacer()
            Section(header:Text("ID")) {
                TextField("输入收藏品 ID", text: $idStr)
                    .frame(height:60)
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.gray.opacity(0.5), lineWidth: 1))
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    
            }
            Spacer()
            Section() {
                HStack {
                    Button("取消"){
                        presentationMode.wrappedValue.dismiss()
                    }
                    .frame(width: 150, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous).stroke(Color.gray, lineWidth: 1))
                    .foregroundColor(Color.gray)
                    Spacer()
                    Button("添加") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .frame(width: 150, height: 50)
                    .overlay(RoundedRectangle(cornerRadius: 25, style: .continuous).stroke(Color.blue, lineWidth: 1))
                }
            }
        }
        .listStyle(.insetGrouped)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .modifier(SearchListModifier())
        .navigationTitle("导入 NFT")
    }
}

struct AddNFTView_Previews: PreviewProvider {
    static var previews: some View {
        AddNFTView()
    }
}
