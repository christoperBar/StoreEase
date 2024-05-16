//
//  Item.swift
//  StoreEase
//
//  Created by MacBook Pro on 15/05/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}