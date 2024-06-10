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
                Text(activity.date.formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Text(activity.date.formatted(date: .omitted, time: .shortened))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }.padding(.vertical, 3)
        
    }
}

