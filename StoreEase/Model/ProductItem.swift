//
//  Item.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 16/05/24.
//

import Foundation


struct ProductItem: Hashable,Identifiable,Codable {
    var id: Int
    var name: String
    var stocks: Int
}
