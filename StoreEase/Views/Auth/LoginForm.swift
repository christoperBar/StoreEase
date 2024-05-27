//
//  LoginForm.swift
//  StoreEase
//
//  Created by MacBook Pro on 21/05/24.
//

import SwiftUI
import SwiftData

struct LoginForm: View {
    @Environment(ModelData.self) var modelData
    @State var username: String = ""
    @State var password: String = ""
    @State var isShowingAlert: Bool = false
    @State var alertMessage: String = ""
    @Query var admins: [Admin]
    @Query var roots: [Root]
    
    var body: some View {
        VStack(){
            VStack {
               Text("Login")
                   .font(.largeTitle)
                   .padding(.bottom, 40)

               TextField("Username", text: $username)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding(.bottom, 5)

               SecureField("Password", text: $password)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding(.bottom, 20)

               Button(action: {
                   if username.isEmpty || password.isEmpty {
                       alertMessage = "Please enter both username and password"
                       isShowingAlert = true
                   } else {
                       authenticate()
                   }
               }) {
                   Text("Login")
               }
               .alert(isPresented: $isShowingAlert) {
                   Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
               }
           }
           .padding()
        }
        .frame(maxWidth: 400, minHeight: 450,alignment: .topLeading)
        .navigationTitle("StoreEase")
        .padding()
        
        Spacer()
    }
    
    func authenticate() -> Void {
        var usersQuery: [any User] = admins as [User]
        usersQuery += roots
        if let user = usersQuery.first(where: { $0.username == username }){
            if user.isMatched(username: username, password: password){
                modelData.currentUser = user
            }
            else{
                alertMessage = "Invalid password"
                isShowingAlert = true
            }
        }
        else{
            alertMessage = "Username not found"
            isShowingAlert = true
        }
    }
}

#Preview {
    LoginForm()
        .environment(ModelData())
}
