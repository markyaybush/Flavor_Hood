//
//  RestaurantEditView.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/21/25.
//

import PhotosUI
import SwiftUI
import SwiftData

struct RestaurantEditView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Bindable var user: User
    @State private var addNewRestaurant = ""
    @Query var restaurants: [Restaurants] = []
    @State private var photosItem: PhotosPickerItem?
    @State private var restaurantPriority = false
    var sortedRestaurants: [Restaurants] {
        user.restaurants.sorted {
            $0.name < $1.name
        }
    }
    
    var body: some View {
        List {
            Text("Favorite Restaurants")
                .font(.title)
                .bold(true)
                .foregroundColor(.tangerine)
                .padding(.leading, 20)
                
            Section {
                if let imageData = user.image {
                    if let image = UIImage(data: imageData) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                    }
                }
                
                PhotosPicker("Attach a food photo", selection: $photosItem, matching: .images)
            }
            
            Section("Restaurant Priority") {
                Picker("Priority", selection: $user.priority) {
                    Text("Yes").tag(1)
                    Text("Maybe").tag(2)
                    Text("No").tag(3)
                }
                .pickerStyle(.segmented)
                
            Section("Add Restaurants") {
                ForEach(sortedRestaurants) { restaurant in
                    Text(restaurant.name)
                }
                .onDelete(perform: deleteRestaurants)
                
                HStack {
                    TextField("Add Restaurant", text: $addNewRestaurant)
                    Button("Add", action: addRestaurants)
                }
            }
            .navigationTitle("Edit Preferences")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: photosItem) {
                Task {
                    user.image = try? await photosItem?.loadTransferable(type: Data.self)
                }
            }
            }
        }
    }
    
    
    func addRestaurants() {
        guard addNewRestaurant.isEmpty == false else { return }
        
        withAnimation {
            let restaurants = Restaurants(name: addNewRestaurant)
            //modelContext.insert(restaurants)
            user.restaurants.append(restaurants)
            addNewRestaurant = ""
            
        }
    }
    func deleteRestaurants(_ indexSet: IndexSet) {
        for index in indexSet {
            let restaurants = sortedRestaurants[index]
            modelContext.delete(restaurants)
        }
    }
    func disableRestaurantButton() -> Bool {
        return addNewRestaurant.isEmpty
    }
}

#Preview {
   RestaurantEditView(user: .init())
}
