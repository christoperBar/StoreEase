//
//  AccountList.swift
//  StoreEase
//
//  Created by MacBook Pro on 21/05/24.
//

import SwiftUI

struct AccountList: View {
    @Environment(ModelData.self) var modelData
    @State private var isShowingSheet = false
    @State private var username = ""
    @State private var password = ""

    
    var adminUsers: [Admin] {
         modelData.users.compactMap { $0 as? Admin }
     }
    
    var body: some View {
        List() {
            Section (header: HStack{
                Text("Admins")
                    .padding(.leading, 7.0)
            }.padding(.horizontal)
            ){
                ForEach(adminUsers) { account in
                    AccountRow(account: account)
                        .contextMenu {
                            Button(action: {
                                if let index = modelData.users.firstIndex(where: { $0.id == account.id }) {
                                    modelData.users.remove(at: index)
                                }
                            }) {
                                Text("Delete")
                            }
                        }

                }
            }
        }
        .navigationTitle("Stocks")
        .toolbar {
            ToolbarItemGroup {
                Button(action: {
                    isShowingSheet.toggle()
                }) {
                    Label("", systemImage: "plus")
                }
                .sheet(isPresented: $isShowingSheet,
                        onDismiss: {isShowingSheet = false}) {
                    AddAdminSheet("Add Admin", username: $username, password: $password, onSubmit: {
                        let newAccount = Admin(username: username, password: password)
                         modelData.users.append(newAccount)
                         isShowingSheet = false
                     }){
                         isShowingSheet = false
                     }
                 }
            }
        }
    }
}

#Preview {
    AccountList()
        .environment(ModelData())
}


