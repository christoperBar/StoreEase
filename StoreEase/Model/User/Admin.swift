//
//  Admin.swift
//  StoreEase
//
//  Created by MacBook Pro on 21/05/24.
//

import Foundation
import SwiftData

@Model
class Admin: User{
    var id: String
    var username: String
    var password: String
    
    init(username: String, password: String, context: ModelContext) {
        self.id = UUID().uuidString
        self.username = username
        self.password = password
        
        context.insert(self)
    }
    
    func displayRole() -> String {
        return "Admin"
    }
    
    func isMatched(username: String, password: String) -> Bool {
        return self.username == username && self.password == password
    }
    
    
    func updatePassword(_ password:String) -> Void {
        self.password = password
    }
    
    func deleteAccount(context: ModelContext) -> Void {
        context.delete(self)
    }
}
