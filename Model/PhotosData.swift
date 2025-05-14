//
//  PhotosData.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/30/25.
//

import Foundation
import SwiftData

@Model
class PhotosData {
    var id: UUID
    var imageData: Data
    var dateAdded: Date
    
    init(
        id: UUID = .init(),
        imageData: Data,
        dateAdded: Date = Date()
    ) {
        self.id = id
        self.imageData = imageData
        self.dateAdded = dateAdded
    }
}
