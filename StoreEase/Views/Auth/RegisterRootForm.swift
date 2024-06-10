//
//  RegisterRootForm.swift
//  StoreEase
//
//  Created by MacBook Pro on 22/05/24.
//

import SwiftUI

struct RegisterRootForm: View {
    @Environment(ModelData.self) var modelData
    @Environment(\.modelContext) private var context
    @State var username: String = ""
    @State var password: String = ""
    @State var isShowingAlert: Bool = false
    @State var alertMessage: String = ""
    @State var isAgree: Bool = false
    
    var body: some View {
        VStack(){
            Text("Root Register")
                .font(.largeTitle)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading) {
               
    
               TextField("Username", text: $username)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding(.bottom, 5)

               SecureField("Password", text: $password)
                   .textFieldStyle(RoundedBorderTextFieldStyle())
                   .padding(.bottom, 20)
                
                Toggle(isOn: $isAgree) {
                    Text("You can't change your password, so make sure you remember your password")
                        .font(.body)
                }
                .toggleStyle(.checkbox)
                .padding(.bottom, 10)
                
               Button(action: {
                   if username.isEmpty || password.isEmpty {
                       alertMessage = "Please enter both username and password"
                       isShowingAlert = true
                   } else {
                       let newAccount = Root(username: username, password: password, context: context)
                       modelData.currentUser = newAccount
                   }
               }){
                   Text("Register")
               }.disabled(!isAgree)
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
}

#Preview {
    RegisterRootForm()
}
