//
//  RestaurantViewModel.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 4/30/25.
//

import Foundation

class RestaurantViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = [
        Restaurant (name: "Hudson Cafe", address: "", imageName: "hudson_cafe_image", description: "A five-star restaurant in Napa Valley.", priceLevel: 2),
        
        Restaurant(name: "Cannelle", address: "", imageName: "cannelle", description: "At cannelle, we bring the heart of French banking to Southeast Michigan, crafting artisanal pastries and baked goods that delight the senses.", priceLevel: 2),
        
        Restaurant(name: "Detroit Rosa", address: "", imageName: "rosa", description: "We believe how we do what we do matters - from serving high-quality coffee to cultivating strong leadership within our team. We set the standard and stand in a league of our own", priceLevel: 2),
    ]
    
    func removeTopRestaurant() {
        if !restaurants.isEmpty {
            restaurants.removeFirst()
        }
        
    }
}

