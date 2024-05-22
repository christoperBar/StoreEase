//
//  AccountRow.swift
//  StoreEase
//
//  Created by MacBook Pro on 21/05/24.
//

import SwiftUI

struct AccountRow: View {
    var account: Admin
    
    var body: some View {
        HStack{
            Image(systemName: "person.circle")  // SF Symbol for profile
                .font(.system(size: 24))       // Adjust the size of the icon
                .padding(.leading, 10)
            Text(account.username)
                .font(.headline)
                .fontWeight(.regular)
                .padding(.trailing, 10)
            Spacer()
        }
        .padding(.vertical, 6)
    }
}
