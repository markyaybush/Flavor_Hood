//
//  UserListingView.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/20/25.
//

import SwiftData
import SwiftUI

struct UserListingView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: [SortDescriptor(\User.priority, order: .reverse), SortDescriptor(\User.name)]) var user: [User]
    
    var body: some View {
        List {
            ForEach(user) { user in
                NavigationLink(value: user) {
                VStack(alignment: .leading) {
                    Text("\(user.name)")
                        .font(.headline)
                    RestaurantEditView(user: user)
                    Text(user.date.formatted(date: .long, time: .shortened))
                    
                }
            }
            }
            .onDelete(perform: deleteFoodPreferences)
            .onDelete(perform: deleteAllergies)
        }
    }
    init(sort: [SortDescriptor<User>], searchString: String, minimumDate: Date) {
        _user = Query(
filter: #Predicate {
            if searchString.isEmpty {
                return $0.date > minimumDate
            } else {
                return $0.date > minimumDate && $0.name
                    .localizedStandardContains(
                        searchString
                    ) || $0.restaurants.contains {
                        $0.name.localizedStandardContains(searchString)
                    } 
            }
        },
 sort: sort)
    }
                      
    func deleteFoodPreferences(_ indexSet: IndexSet) {
        for index in indexSet {
            let user = user[index]
            modelContext.delete(user)
        }
    }
    func deleteAllergies(_ indexSet: IndexSet) {
        for index in indexSet {
            let user = user[index]
            modelContext.delete(user)
        }
    }
}

#Preview {
    UserListingView(
        sort: [SortDescriptor(\User.name)],
        searchString: "",
        minimumDate: .distantPast
    )
}
