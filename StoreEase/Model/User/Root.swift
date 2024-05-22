//
//  Root.swift
//  StoreEase
//
//  Created by MacBook Pro on 21/05/24.
//

import Foundation
import SwiftData

@Model
class Root: User{
    var id: String
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.id = UUID().uuidString
        self.username = username
        self.password = password
    }
    
    func displayRole() -> String {
        return "Root"
    }
    
    func isMatched(username: String, password: String) -> Bool {
        return self.username == username && self.password == password
    }
}
