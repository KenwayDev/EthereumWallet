//
//  BriefHeaderView.swift
//  EthereumWallet
//
//  Created by Kenway Cen on 2022/6/2.
//

import SwiftUI

struct BriefHeaderView: View {
    var icon: String
    var name: String
    var detail: String
    var account: String?
    var body: some View {
        VStack {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 40, style: .continuous).stroke(Color.blue, lineWidth: 2))
            Spacer()
            Text(name)
                .font(.title)
            Text(detail)
                .foregroundColor(.gray)
            if let account = account {
                Text(account)
                    .padding(EdgeInsets(top: 0,leading: 5,bottom: 0,trailing: 5))
                    .frame(width: 100, height: 25)
                    .font(.system(size: 14))
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(15)
            }
            
        }.padding(.bottom, 10)
        HStack {
            Button(action: {
                
            }) {
                VStack {
                    Image("receive")
                        .resizable()
                        .scaledToFit()
                        .frame(width:25, height:25)
                    Text("接收")
                        .font(.system(size: 14))
                }
                
            }
            
            Button(action: {
                
            }) {
                VStack {
                    Image("selected-wallet-icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width:25, height:25)
                    Text("购买")
                        .font(.system(size: 14))
                }
                
            }
            Button(action: {
                
            }) {
                VStack {
                    Image("send")
                        .resizable()
                        .scaledToFit()
                        .frame(width:25, height:25)
                    Text("发送")
                        .font(.system(size: 14))
                }
                
            }
            Button(action: {
                
            }) {
                VStack {
                    Image("interaction")
                        .resizable()
                        .scaledToFit()
                        .frame(width:25, height:25)
                    Text("交换")
                        .font(.system(size: 14))
                }
                
            }
            
        }.padding(.bottom, 40)
    }
}

struct BriefHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        BriefHeaderView(icon: "", name: "", detail: "", account: "")
    }
}
