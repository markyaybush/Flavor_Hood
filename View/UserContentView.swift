//
//  UserContentView.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/19/25.
//

import SwiftUI
import SwiftData

struct UserContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var path = [User]()
    @State private var sortOrder = [SortDescriptor(\User.name), SortDescriptor(\User.date)]
    
    @State private var searchText = ""
    @State private var minimumDate = Date.distantPast
    let currentDate = Date.now
    
     
    
    var body: some View {
        NavigationStack(path: $path) {
            UserListingView(
                sort: sortOrder,
                searchString: searchText,
                minimumDate: minimumDate)
            .navigationTitle("User Content")
            .navigationDestination(
                for: User.self) {user in
                    FoodPreferenceView(user: user)
                }
            .searchable(text: $searchText)
            .toolbar {
                Button(
                    "Food Preferences",
                    systemImage: "fork.knife.circle.fill",
                    action: addPreferences
                )
                    
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name")
                            .tag([SortDescriptor(\User.name), SortDescriptor(\User.date)])

                        Text("Priority")
                            .tag([SortDescriptor(\User.priority, order: .reverse), SortDescriptor(\User.name)])

                        Text("Date")
                            .tag([SortDescriptor(\User.date), SortDescriptor(\User.name)])
                    }
                    Picker("Filter", selection: $minimumDate) {
                        Text("Show all restaurant dates")
                            .tag(Date.distantPast)
                        
                        Text("Show upcoming restaurant dates")
                            .tag(currentDate)
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }
    func addPreferences() {
        let user = User()
        modelContext.insert(user)
        path = [user]
        let american = User(name: "American")
        let French = User(name: "French")
        let Italian = User(name: "Italian")
        let Mexican = User(name: "Mexican")
        let Asian = User(name: "Asian")
        
        modelContext.insert(american)
        modelContext.insert(French)
        modelContext.insert(Italian)
        modelContext.insert(Mexican)
        modelContext.insert(Asian)
    }
}

#Preview {
    UserContentView()
}
