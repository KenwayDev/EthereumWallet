//
//  CustomAssetsView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/3.
//

import SwiftUI

struct CustomAssetsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var address: String = ""
    @State private var symble: String = ""
    @State private var calculate: String = ""
    var body: some View {
        List{
            Section(header:Text("代币地址")) {
                TextField("0x...", text: $address)
                    .frame(height:60)
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.gray.opacity(0.5), lineWidth: 1))
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    
            }
            Section(header:Text("代币符号")) {
                TextField("GNO", text: $symble)
                    .frame(height:60)
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.gray.opacity(0.5), lineWidth: 1))
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    
            }
            Section(header:Text("代币精度")) {
                TextField("18", text: $calculate)
                    .frame(height:60)
                    .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(Color.gray.opacity(0.5), lineWidth: 1))
                    .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    
            }
            Section() {
                HStack {
                    Button("取消"){
                        presentationMode.wrappedValue.dismiss()
                    }
                    .frame(width: 150, height: 60)
                    .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.gray, lineWidth: 1))
                    .foregroundColor(Color.gray)
                    Spacer()
                    Button("添加代币") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .frame(width: 150, height: 60)
                    .overlay(RoundedRectangle(cornerRadius: 30, style: .continuous).stroke(Color.blue, lineWidth: 1))
                }
            }
        }
        .listStyle(.insetGrouped)
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .modifier(SearchListModifier())
    }
}

struct CustomAssetsView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAssetsView()
    }
}
