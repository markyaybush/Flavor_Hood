//
//  Restaurant.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 4/30/25.
//

import Foundation

struct Restaurant: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let address: String
    let imageName: String
    let description: String
    let priceLevel: Int
}
