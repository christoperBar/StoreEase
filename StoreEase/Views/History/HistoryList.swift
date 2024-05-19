//
//  HistoryList.swift
//  StoreEase
//
//  Created by MacBook Pro on 16/05/24.
//

import SwiftUI

struct HistoryList: View {
    @Environment(ModelData.self) var modelData
//    @State private var searchText = ""
    @State private var dateFilter = Date()
    @State private var filter = FilterActivity.all
    @State private var inspectorIsShown: Bool = false
    @State private var activityId: String = ""
//    @State private var selectedActivity: Activity?
    
//    var activity: Activity
    
    enum FilterActivity: String, CaseIterable, Identifiable {
        case all = "All"
        case check_in = "Check-in"
        case check_out = "Check-out"

        var id: FilterActivity { self }
    }
    
    var filteredHistory: [Activity] {
        activities.filter { activity in
            let matchesType = filter == .all || filter.rawValue == activity.type.rawValue
            let matchesDate = Calendar.current.isDate(activity.date, equalTo: dateFilter, toGranularity: .day)
            return matchesType && matchesDate
        }
    }
    
//    var index: Int? {
//        activities.firstIndex(where: { $0.id == selectedActivity?.id })
//    }
    
    var body: some View {
        
//        List(selection: $selectedActivity){
        List(){
            DatePicker("Date", selection: $dateFilter, displayedComponents: .date)
                .datePickerStyle(.compact)
            
            ForEach(filteredHistory) { activity in
                HistoryRow(activity: activity)
                    .onTapGesture {
                        inspectorIsShown = true
                        activityId = activity.id
                    }
            }
//            .focusedValue(\.selectedActivity, activities[index ?? 0])
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
            if let activity = getActivityById(id: activityId) {
                ActivityDetail(activity: activity)
                    .frame(minWidth: 100, maxWidth: .infinity)
            } else {
                Text("Please select history")
            }
        }
//        .searchable(text: $searchText, prompt: "Search")
    }
}

func getActivityById(id: String?) -> Activity? {
    guard let id = id else { return nil }
    return activities.first { $0.id == id }
}

#Preview {
    HistoryList()
        .environment(ModelData())
}
