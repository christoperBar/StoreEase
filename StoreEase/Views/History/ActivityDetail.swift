//
//  ActivityDetail.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

struct ActivityDetail: View {
    
    var body: some View {
        
        List{
            Section(header: Text("Check-in Summary").bold().font(.title)){
                HStack{
                    Text("Admin")
                        .font(.body)
                    Spacer()
                    Text("Wuwung")
                        .font(.body)
                        .foregroundStyle(.secondary)
                }.padding(.vertical, 3)

                HStack{
                    Text("Date")
                        .font(.body)
                    Spacer()
                    Text("2024-02-02")
                        .font(.body)
                        .foregroundStyle(.secondary)
                }.padding(.vertical, 3)

                HStack{
                    Text("Time")
                        .font(.body)
                    Spacer()
                    Text("12:15")
                        .font(.body)
                        .foregroundStyle(.secondary)
                }.padding(.vertical, 3)
                
            }
            
            Section(header: Text("Items")){
                ActivityItemRow()
                ActivityItemRow()
            }
        }
        .navigationTitle("Check-in Summary")
    }
}

#Preview {
    ActivityDetail()
}
