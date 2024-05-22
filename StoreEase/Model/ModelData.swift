//
//  ModelData.swift
//  StoreEase
//
//  Created by MacBook Pro on 19/05/24.
//

import Foundation

@Observable
class ModelData {
    var currentUser: (any User)? = nil
    
    var users:[any User] = [
        Root(username: "Tefer", password: "Tefer123"),
        Admin(username: "Jerry", password: "jejer"),
        Admin(username: "Azewt", password: "azezet")
    ]
    
   
    
}

