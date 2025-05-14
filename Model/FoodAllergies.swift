//
//  FoodAllergies.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/27/25.
//

import Foundation
import SwiftData

@Model
class FoodAllergies {
    var name: String
    var foodAllergyNames = ["Gluten", "Shellfish", "Peanuts", "Tree Nuts", "Eggs", "Dairy", "Soy", "Fish", "Wheat", "Sesame", "Lactose", "Strawberries", "Carrots", "Sulphites", "Mustard", "Lupin", "Moluscs", "Soya", "Celery", "Garlic", "Avacados", "Kiwi", "Peaches", "Mushrooms", "Passionfruit", "Onions", "Chamomile", "Chocolate", "Other Allergies"]
    var user: User?
    var isSelected: Bool = false
    
    init(name: String, foodAllergyNames: [String] = ["Gluten", "Shellfish", "Peanuts", "Tree Nuts", "Eggs", "Dairy", "Soy", "Fish", "Wheat", "Sesame", "Lactose", "Strawberries", "Carrots", "Sulphites", "Mustard", "Lupin", "Moluscs", "Soya", "Celery", "Garlic", "Avacados", "Kiwi", "Peaches", "Mushrooms", "Passionfruit", "Onions", "Chamomile", "Chocolate", "Other Allergies"], user: User? = nil, isSelected: Bool) {
        self.name = name
        self.foodAllergyNames = foodAllergyNames
        self.user = user
        self.isSelected = isSelected
    }
}

@Model
class SelectedAllergies {
    var category: Category
    
    init(category: Category) {
        self.category = category
    }
    
}

extension SelectedAllergies {
    enum Category: String, Codable, CaseIterable {
        case gluten = "Gluten"
        case shellfish = "Shellfish"
        case peanuts = "Peanuts"
        case treeNuts = "Tree Nuts"
        case eggs = "Eggs"
        case dairy = "Dairy"
        case soy = "Soy"
        case fish = "Fish"
        case wheat = "Wheat"
        case sesame = "Sesame"
        case lactose = "Lactose"
        case strawberries = "Strawberries"
        case carrots = "Carrots"
        case sulphites = "Sulphites"
        case mustard = "Mustard"
        case lupin = "Lupin"
        case moluscs = "Moluscs"
        case soya = "Soya"
        case celery = "Celery"
        case garlic = "Garlic"
        case avocados = "Avocados"
        case kiwis = "Kiwis"
        case peaches = "Peaches"
        case mushrooms = "Mushrooms"
        case passionfruit = "Passionfruit"
        case onions = "Onions"
        case chamomile = "Chamomile"
        case chocolate = "Chocolate"
        case otherAllergies = "Other allergies"
        
    }
}
