//
//  FlavorHoodTabView.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/22/25.
//

import SwiftUI

struct FlavorHoodTabView: View {
    var body: some View {
        
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                    
                }
            UserProfile(user: User())
                .tabItem {
                    Label("Users", systemImage: "person.crop.circle")
                }
            RestaurantEditView(user: User())
                .tabItem {
                    Label("Restaurant View", systemImage: "cup.and.heat.waves.fill")
                }
            UserContentView()
                .tabItem {
                    Label("User Content", systemImage: "square.and.arrow.up")
                }
        }
        }
}

#Preview {
    FlavorHoodTabView()
}
