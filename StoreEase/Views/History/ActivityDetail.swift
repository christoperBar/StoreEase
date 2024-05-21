//
//  ActivityDetail.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

struct ActivityDetail: View {
    
    var activity: Activity
    
    var body: some View {
        
        List{
            Section(header: Text("\(activity.type.rawValue) Summary").bold().font(.title)){
                HStack{
                    Text("Admin")
                        .font(.body)
                    Spacer()
                    Text(activity.admin.username)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }.padding(.vertical, 3)

                HStack{
                    Text("Date")
                        .font(.body)
                    Spacer()
                    Text(activity.date.formatted(date: .numeric, time: .omitted))
                        .font(.body)
                        .foregroundStyle(.secondary)
                }.padding(.vertical, 3)

                HStack{
                    Text("Time")
                        .font(.body)
                    Spacer()
                    Text(activity.date.formatted(date: .omitted, time: .standard))
                        .font(.body)
                        .foregroundStyle(.secondary)
                }.padding(.vertical, 3)
                
            }
            
            Section(header: Text("Items and Quantity Added")){
                ForEach(activity.listOfAddedProduct) { addedProduct in
                    ActivityItemRow(addedProduct: addedProduct)
                }
            }
        }
        .navigationTitle("Check-in Summary")
    }
}

#Preview {
    ActivityDetail(activity: activities[0])
}
