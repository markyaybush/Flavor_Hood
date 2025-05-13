//
//  RestaurantViewModel.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 4/30/25.
//

import Foundation

class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = [
        Restaurant (name: "The oyc", imageName: "royce", description: "A five-star restaurant in Napa Valley."),
        
        Restaurant(name: "Cannelle", imageName: "cannelle", description: "At cannelle, we bring the heart of French banking to Southeast Michigan, crafting artisanal pastries and baked goods that delight the senses."),
        
        Restaurant(name: "Detroit Rosa", imageName: "rosa", description: "We believe how we do what we do matters - from serving high-quality coffee to cultivating strong leadership within our team. We set the standard and stand in a league of our own"),
    ]
    
    func removeTopRestaurant() {
        if !restaurants.isEmpty {
            restaurants.removeFirst()
        }
        
    }
}
