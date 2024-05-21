//
//  Root.swift
//  StoreEase
//
//  Created by MacBook Pro on 21/05/24.
//

import Foundation

struct Root: User{
    var id: String = UUID().uuidString
    var username: String
    var password: String
    
    func displayRole() -> String {
        return "Root"
    }
    
    func isMatched(username: String, password: String) -> Bool {
        return self.username == username && self.password == password
    }
}
