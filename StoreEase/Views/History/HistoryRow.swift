//
//  HistoryRow.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

struct HistoryRow: View {
    var activity: Activity
    
    var body: some View {
        VStack(alignment: .leading){
            Text(activity.type.rawValue)
                .font(.body)
            HStack{
                Text("2005-03-11")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Text("12:00")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }.padding(.vertical, 3)
        
    }
}

#Preview {
    return Group {
        HistoryRow(activity: activities[0])
        HistoryRow(activity: activities[1])
    }
    
}
