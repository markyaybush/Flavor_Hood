//
//  Restaurants.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/21/25.
//

import Foundation
import SwiftData

@Model
class Restaurants {
    var name : String
    var user: User?
    
    init(name: String) {
        self.name = name
    }
}
