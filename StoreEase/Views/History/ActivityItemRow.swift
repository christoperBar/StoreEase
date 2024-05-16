//
//  ActivityItemRow.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

struct ActivityItemRow: View {
    var body: some View {
        HStack{
            Text("Rinso")
                .font(.body)
            
            Spacer()
            
            Text("3")
                .font(.body)
                .foregroundStyle(.secondary)
        }.padding(.vertical, 3)
    }

}

#Preview {
    return Group{
        ActivityItemRow()
        ActivityItemRow()

    }
}
