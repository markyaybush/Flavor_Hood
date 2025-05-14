//
//  User.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/16/25.
//

import PhotosUI
import Foundation
import SwiftData

@Model
class User {
    var name: String
    var email: String
    var details: String
    var date: Date = Date()
    var priority : Int
    @Relationship(deleteRule: .cascade, inverse: \FoodAllergies.user) var allergies: [FoodAllergies] = []
    @Relationship(deleteRule: .cascade, inverse: \FoodFavorites.user) var favFoods = [FoodFavorites]()
    @Relationship(deleteRule: .cascade, inverse: \Restaurants.user) var restaurants = [Restaurants]()
    @Relationship(deleteRule: .cascade, inverse: \FoodPreferences.user) var foodPreferences: [FoodPreferences] = []
    @Attribute(.externalStorage) var image: Data?
    
    init(
        name: String = "",
        email: String = "",
        details: String = "",
        date: Date = .now,
        priority: Int = 2
    ) {
        self.name = name
        self.email = email
        self.details = details
        self.date = date
        self.priority = priority
    }
    
}



