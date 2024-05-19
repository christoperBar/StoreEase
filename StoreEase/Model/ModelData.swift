//
//  ModelData.swift
//  StoreEase
//
//  Created by MacBook Pro on 19/05/24.
//

import Foundation

@Observable
class ModelData {
    var products:[Product] = [

        Product(name:"Surya 12", stocks: 4),
        Product(name:"Tali Jagat", stocks: 7),
        Product(name:"Sampoerna", stocks: 9),
        Product(name:"Djisamsoe", stocks: 2),
        Product(name:"Malboro", stocks: 3),
        Product(name:"International", stocks: 8),
        Product(name:"76 Kretek", stocks: 1),
        Product(name:"Mangga 76", stocks: 15),
        Product(name:"Dunhill", stocks: 12),
        Product(name:"Gudang Garam Merah", stocks: 18),
        Product(name:"92 Kretek", stocks: 16),
        Product(name:"Gajah Baru", stocks: 5),
        Product(name:"Lucky Strike", stocks: 19)

    ]
   
    var activities:[Activity] = [

        Activity(type: .checkIn, date: makeDate(year: 2024, month: 3, day: 24, hour: 12, minute: 43, second: 44 ), listOfAddedProduct: [
            AddedProduct(product: Product(name:"Surya 12", stocks: 4), qty: 5),
            AddedProduct(product: Product(name:"Tali Jagat", stocks: 7), qty: 3)

        ]),
        Activity(type: .checkOut, date: Date(), listOfAddedProduct: [
            AddedProduct(product: Product(name:"Djisamsoe", stocks: 2), qty: 1),
            AddedProduct(product: Product(name:"Malboro", stocks: 3), qty: 2)
        ])
    ]
    
}
