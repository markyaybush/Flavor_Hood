//
//  FoodPreferences.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/21/25.
//

import Foundation
import SwiftData

@Model
class FoodPreferences {
    var name: String
    var foodPreferenceNames = ["Italian", "Japanese", "Chinese", "Indian", "Mexican", "Thai", "Greek", "Middle Eastern", "American", "French", "Vietnamese", "Peruvian", "Moroccan", "Cuban", "Spanish", "Russian", "Turkish", "Brazilian", "Nigerian", "Carribien", "Indonesian", "Kenyan", "South African", "Polish", "Korean", "Vegan", "Gluten Free", "Vegetarian", "Dairy Free", "Other Preferences", "Mongolian", "Nut Free", "Egg Free", "European"].sorted()
    var user: User?
    var isSelected: Bool
    
    init(name: String, foodPreferenceNames: [String] = ["Italian", "Japanese", "Chinese", "Indian", "Mexican", "Thai", "Greek", "Middle Eastern", "American", "French", "Vietnamese", "Peruvian", "Moroccan", "Cuban", "Spanish", "Russian", "Turkish", "Brazilian", "Nigerian", "Carribean", "Indonesian", "Kenyan", "South African", "Polish", "Korean", "Vegan", "Gluten Free", "Vegetarian", "Dairy Free", "Other Preferences", "Mongolian", "Nut Free", "Egg Free", "European"].sorted(), user: User? = nil, isSelected: Bool) {
        self.name = name
        self.foodPreferenceNames = foodPreferenceNames
        self.user = user
        self.isSelected = isSelected
    }
}

@Model
class SelectedFoodPreferences {
    var category: Category
    
    init(category: Category) {
        self.category = category
    }
    
}

extension SelectedFoodPreferences {
    enum Category: String, Codable, CaseIterable {
        case italian = "Italian"
        case japanese = "Japanese"
        case chinese = "Chinese"
        case indian = "Indian"
        case mexican = "Mexican"
        case thai = "Thai"
        case greek = "Greek"
        case middleEastern = "Middle Eastern"
        case american = "American"
        case french = "French"
        case vietnamese = "Vietnamese"
        case peruvian = "Peruvian"
        case morroccan = "Moroccan"
        case cuban = "Cuban"
        case spanish = "Spanish"
        case russian = "Russian"
        case turkish = "Turkish"
        case brazillian = "Brazilian"
        case nigerian = "Nigerian"
        case carribean = "Caribbean"
        case indonesian = "Indonesian"
        case kenyan = "Kenyan"
        case southAfrican = "South African"
        case polish = "Polish"
        case korean = "Korean"
        case vegan = "Vegan"
        case glutenFree = "Gluten Free"
        case vegetarian = "Vegetarian"
        case dairyFree = "Dairy Free"
        case otherPreferences = "Other Preferences"
        case mongolian = "Mongolian"
        case nutFree = "Nut Free"
        case eggFree = "Egg Free"
        case european = "European"
    }
}
