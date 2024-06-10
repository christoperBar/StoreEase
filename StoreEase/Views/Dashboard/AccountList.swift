//
//  AccountList.swift
//  StoreEase
//
//  Created by MacBook Pro on 21/05/24.
//

import SwiftUI
import SwiftData

struct AccountList: View {
    @Environment(ModelData.self) var modelData
    @Environment(\.modelContext) private var context
    @State private var isShowingSheet = false
    @State private var isShowingUpdateSheet = false
    @State private var selectedSheet: Int = 0
    @State private var username = ""
    @State private var password = ""
    @State private var resetPassword = ""
    @Query (sort:\Admin.username) private var admins: [Admin]
    
    var body: some View {
        List() {
            Section (header: HStack{
                Text("Admins")
                    .padding(.leading, 7.0)
            }.padding(.horizontal)
            ){
                ForEach(admins) { account in
                    AccountRow(account: account)
                        .contextMenu {
                            Button(action: {
                                if let index = admins.firstIndex(where: { $0.id == account.id }) {
                                    isShowingUpdateSheet.toggle()
                                    selectedSheet = index
                                }
                            }) {
                                Text("Reset Password")
                            }
                            Button(action: {deleteAdminAccount(account: account)}) {
                                Text("Delete")
                            }
                        }
                }
            }
        }
        .sheet(isPresented: $isShowingUpdateSheet,
                onDismiss: {isShowingUpdateSheet = false}) {
             ResetPasswordSheet("Update Admin",password: $resetPassword, onSubmit: {
                 admins[selectedSheet].updatePassword(resetPassword)
                 isShowingUpdateSheet = false
             }){
                 isShowingUpdateSheet = false
             }
         }
        .navigationTitle("Admins")
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
                        _ = Admin(username: username, password: password, context: context)
                        isShowingSheet = false
                     }){
                        isShowingSheet = false
                     }
                 }
                Button(action: {
                    modelData.currentUser = nil
                }) {
                    Label("", systemImage: "rectangle.portrait.and.arrow.right")
                }
            }
        }
        
    }
    
    func deleteAdminAccount(account: Admin) -> Void {
        if admins.firstIndex(where: { $0.id == account.id }) != nil {
            account.deleteAccount(context: self.context)
        }
    }
    
}

#Preview {
    AccountList()
        .environment(ModelData())
}


