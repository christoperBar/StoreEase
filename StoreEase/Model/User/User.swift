//
//  User.swift
//  StoreEase
//
//  Created by MacBook Pro on 21/05/24.
//

import Foundation

protocol User: Hashable, Identifiable, Codable{
    var id: String { get }
    var username: String { get set }
    var password: String { get set }
    
    func displayRole() -> String
    func isMatched(username: String, password: String) -> Bool
}

enum UserRole {
    case admin
    case root
}

var users:[any User] = [
    Root(username: "Tefer", password: "Tefer123"),
    Admin(username: "Jerry", password: "jejer"),
    Admin(username: "Azewt", password: "azezet")
]


