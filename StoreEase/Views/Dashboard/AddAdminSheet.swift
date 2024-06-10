//
//  AddAdminSheet.swift
//  StoreEase
//
//  Created by MacBook Pro on 21/05/24.
//

import SwiftUI

struct AddAdminSheet: View {
    let title: String
    let username : Binding<String>
    let password : Binding<String>
    let onSubmit: () -> Void
    let onDismiss: () -> Void
    init(_ title: String, username: Binding<String>, password: Binding<String>, onSubmit: @escaping () -> Void, onDismiss: @escaping () -> Void) {
        self.title = title
        self.username = username
        self.password = password
        self.onSubmit = onSubmit
        self.onDismiss = onDismiss
    }
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .padding(10)
            HStack{
                Text("Username:")
                    .font(.body)
                Spacer()
                TextField("Username", text: username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
            }
                .frame(width: 400)
            HStack{
                Text("Password:")
                    .font(.body)
                Spacer()
                SecureField("Password", text: password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
                .frame(width: 400)
                .padding()
            HStack {
                Button("Cancel", action: {
                    onDismiss()
                }).padding()
                Button("Add Account", action: {
                    onSubmit()
                }).padding()
            }
        }
    }
}
