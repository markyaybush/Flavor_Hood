//
//  CloudKitManager.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 5/30/25.
//

import Foundation
import CloudKit
import UIKit

class CloudKitManager {
    private let container = CKContainer.default()
    private let database = CKContainer.default().privateCloudDatabase
    
    func savePhotoRecord(
        image: UIImage,
        restaurantName: String,
        foodName: String,
        price: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        DispatchQueue.global(qos: .userInitiated).async {
            print("⏳ Saving photo to CloudKit...")
            
            guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                DispatchQueue.main.async {
                    print("❌ Failed to get JPEG data from image.")
                    completion(.failure(NSError(domain: "ImageError", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Invalid image data."])))
                }
                return
            }
            
            let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString + ".jpg")
            
            do {
                try imageData.write(to: tempURL)
                let asset = CKAsset(fileURL: tempURL)
                
                let record = CKRecord(recordType: "FoodPhoto")
                record["restaurantName"] = restaurantName as CKRecordValue
                record["foodName"] = foodName as CKRecordValue
                record["price"] = price as CKRecordValue
                record["image"] = asset

                print("✅ Record ready to save to CloudKit")
                
                self.database.save(record) { record, error in
                    DispatchQueue.main.async {
                        if let error = error {
                            print("❌ Error saving record: \(error.localizedDescription)")
                            completion(.failure(error))
                        } else {
                            print("✅ Record saved successfully!")
                            completion(.success(()))
                        }
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    print("❌ Error writing image to disk: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
        }
    }
}
