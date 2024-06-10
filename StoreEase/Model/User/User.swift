//
//  User.swift
//  StoreEase
//
//  Created by MacBook Pro on 21/05/24.
//

import Foundation
import SwiftData

protocol User{
    var id: String { get }
    var username: String { get set }
    var password: String { get set }
    
    func displayRole() -> String
    func isMatched(username: String, password: String) -> Bool
}



