//
//  Restaurant.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 4/30/25.
//

import Foundation

struct Restaurant: Identifiable, Equatable {
    let id: UUID = UUID()
    let name: String
    let imageName: String
    let description: String
}
