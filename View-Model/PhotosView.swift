//
//  PhotosView.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/30/25.
//
import PhotosUI
import SwiftData
import SwiftUI

struct PhotosView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var photos: [PhotosData]
    @State private var photosItem: PhotosPickerItem?
    // @State private var images: [String] = ["photo1", "photo2", "photo3", "photo4"]
    
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $photosItem, matching: .images) {
                Label("Add Photo", systemImage: "plus")
                    .padding()
                    .background(Color.tangerine)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            .onChange(of: photosItem) {
                Task {
                    if let data = try? await photosItem?.loadTransferable(type: Data.self) {
                        let newPhoto = PhotosData(imageData: data)
                        modelContext.insert(newPhoto)
                    }
                }
            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(photos) { photo in
                        if let uiImage = UIImage(data: photo.imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(8)
                                .overlay(
                            Button(action: {
                                modelContext.delete(photo)
//                                uiImage.remove(at: photo)
//                                photos.remove(at: photo)
                            }) {
                                Image(systemName: "trash.fill")
                                    .foregroundColor(.red)
                            }
                                .offset(x: 45, y: -26)
                            )
                                
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    PhotosView()
}
