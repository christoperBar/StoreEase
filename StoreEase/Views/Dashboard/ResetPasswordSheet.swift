//
//  ResetPasswordSheet.swift
//  StoreEase
//
//  Created by MacBook Pro on 21/05/24.
//

import SwiftUI

struct ResetPasswordSheet: View {
    let title: String
    let password : Binding<String>
    let onSubmit: () -> Void
    let onDismiss: () -> Void
    init(_ title: String, username: Binding<String>, password: Binding<String>, onSubmit: @escaping () -> Void, onDismiss: @escaping () -> Void) {
        self.title = title
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
                Button("Reset Password", action: {
                    onSubmit()
                }).padding()
            }
        }
    }
}

//#Preview {
//    AddAdminSheet()
//}
