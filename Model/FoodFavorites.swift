//
//  FoodFavorites.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/22/25.
//

import Foundation
import SwiftData

@Model
class FoodFavorites {
    var name: String
    var user: User?
    
    init(name: String, user: User? = nil) {
        self.name = name
        self.user = user
    }
}
