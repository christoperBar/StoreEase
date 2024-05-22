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
    
   
    var activities:[Activity] = [
        Activity(admin: Admin(username: "Jerry", password: "jejer"), type: .checkIn, date: makeDate(year: 2024, month: 3, day: 24, hour: 12, minute: 43, second: 44 ), listOfAddedProduct: [
            AddedProduct(product: ActivityProduct(convert: Product(name:"Surya 12", stocks: 4)), qty: 5),
            AddedProduct(product: ActivityProduct(convert: Product(name:"Tali Jagat", stocks: 7)), qty: 3)
        ]),
        Activity(admin: Admin(username: "Azewt", password: "azezet"), type: .checkOut, date: Date(), listOfAddedProduct: [
            AddedProduct(product: ActivityProduct(convert: Product(name:"Djisamsoe", stocks: 2)), qty: 1),
            AddedProduct(product: ActivityProduct(convert: Product(name:"Malboro", stocks: 3)), qty: 2)
        ])
    ]
    
}
