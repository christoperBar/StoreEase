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
        Product(id:1, name:"Sorya 12", stocks: 4),
        Product(id:2, name:"Tali Jagat", stocks: 7),
        Product(id:3, name:"Sampoerna", stocks: 9),
        Product(id:4, name:"Djisamsoe", stocks: 2),
        Product(id:5, name:"Malboro", stocks: 3),
        Product(id:6, name:"International", stocks: 8),
        Product(id:7, name:"76 Kretek", stocks: 1),
        Product(id:8, name:"Mangga 76", stocks: 15),
        Product(id:9, name:"Dunhill", stocks: 12),
        Product(id:10, name:"Gudang Garam Merah", stocks: 18),
        Product(id:11, name:"92 Kretek", stocks: 16),
        Product(id:12, name:"Gajah Baru", stocks: 5),
        Product(id:13, name:"Lucky Strike", stocks: 19)
    ]
    var activities:[Activity] = [
        Activity(id: 1, type: .checkIn, date: makeDate(year: 2024, month: 3, day: 24, hour: 12, minute: 43, second: 44 ), listOfAddedProduct: [
            AddedProduct(id: 1, product: Product(id:1, name:"Sorya 12", stocks: 4), qty: 5),
            AddedProduct(id: 2, product: Product(id:2, name:"Tali Jagat", stocks: 7), qty: 3)
        ]),
        Activity(id: 2, type: .checkOut, date: Date(), listOfAddedProduct: [
            AddedProduct(id: 3, product: Product(id:4, name:"Djisamsoe", stocks: 2), qty: 1),
            AddedProduct(id: 4, product: Product(id:5, name:"Malboro", stocks: 3), qty: 2)
        ])
    ]

}
