//
//  Flavor_HoodApp.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 4/30/25.
//

import SwiftData
import SwiftUI


@main
struct Flavor_HoodApp: App {
    var body: some Scene {
        WindowGroup {
           // ContentView()
            FlavorHoodTabView()
                }
        .modelContainer(
            for: [
                User.self,
                Restaurants.self,
                FoodFavorites.self,
                FoodPreferences.self,
                FoodAllergies.self,
                PhotosData.self,
                SelectedFoodPreferences.self,
                SelectedAllergies.self
            ]
        )
        }
    }

