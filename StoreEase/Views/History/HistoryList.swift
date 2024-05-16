//
//  HistoryList.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

struct HistoryList: View {
    
//    @State private var searchText = ""
    @State private var dateFilter = Date()
    @State private var filter = FilterActivity.all
    @State private var inspectorIsShown: Bool = false
    
    enum FilterActivity: String, CaseIterable, Identifiable {
        case all = "All"
        case check_in = "Check-in"
        case check_out = "Check-out"

        var id: FilterActivity { self }
    }
    
    var body: some View {
        
        List{
            DatePicker("Date", selection: $dateFilter, displayedComponents: .date)
                .datePickerStyle(.compact)
            
            HistoryRow()
                .onTapGesture {
                    inspectorIsShown.toggle()
                }
            HistoryRow()
                .onTapGesture {
                    inspectorIsShown.toggle()
                }
            HistoryRow()
                .onTapGesture {
                    inspectorIsShown.toggle()
                }
        }
        .frame(minWidth: 100)
        .navigationTitle("History")
        .toolbar {
            ToolbarItemGroup {
                Menu {
                    Picker("Activity", selection: $filter) {
                        ForEach(FilterActivity.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.inline)

                } label: {
                    Label("Add New Task", systemImage: "slider.horizontal.3")
                }
                Button {
                    inspectorIsShown.toggle()
                } label: {
                    Label("Show inspector", systemImage: "sidebar.right")
                }
            }
        }
        .inspector(isPresented: $inspectorIsShown) {
            ActivityDetail()
                .frame(minWidth: 100, maxWidth: .infinity)
        }
//        .searchable(text: $searchText, prompt: "Search")
    }
}

#Preview {
    HistoryList()
}
