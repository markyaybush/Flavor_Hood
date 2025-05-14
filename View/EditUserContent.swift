//
//  EditUserContent.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/16/25.
//

import PhotosUI
import SwiftUI
import SwiftData

struct EditUserContent: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var user: User
    @Query var food: [FoodFavorites] = []
    @State private var photosItem: PhotosPickerItem?
    @State private var addFoodFavorites = ""
    @State private var addAllergies = ""
    
    
    var sortedRestaurants: [Restaurants] {
        user.restaurants.sorted {
            $0.name < $1.name
        }
    }
    
    var sortedFoods: [FoodFavorites] {
        user.favFoods.sorted {
            $0.name < $1.name
        }
    }
    
    var sortedAllergies: [FoodAllergies] {
        user.allergies.sorted {
            $0.name < $1.name
        }
    }
    
    var body: some View {
        
        NavigationStack {
            Form {
                    Section {
                        if let imageData = user.image {
                            if let image = UIImage(data: imageData) {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        
                        PhotosPicker("Attach photo", selection: $photosItem, matching: .images)
                    }
                    TextField("Name", text: $user.name)
                    TextField("Details", text: $user.details)
                    
                    //                 Put food preferences here
                    //                Section("Food Preferences") {
                    //                    LazyVStack {
                    //                        List {
                    //                            FoodPreferenceView()
                    //                            Spacer()
                    //                                .listStyle(.plain)
                    //
                    //                        }
                    //                    }
                    //                }
                    
//                    Section("Favorite Foods") {
//                        List {
//                            ForEach(user.favFoods, id: \.self) { food in
//                                Text(food.name)
//                            }
//                            .onDelete(perform: deleteFoodFavorites(_:))
//                            HStack {
//                                TextField("Favorite Foods", text: $addFoodFavorites)
//                                Button("Add") {
//                                    addFavoriteFoods()
//                                }
//                            }
//                        }
//                    }
//                    Section("Allergy Information") {
//                        List {
//                            ForEach(user.allergies, id: \.self) { food in
//                                Text(food.name)
//                            }
//                            .onDelete( perform: deleteFoodAllergies(_:))
//                            HStack {
//                                TextField("Allergies", text: $addAllergies)
//                                Button("Add") {
//                                    addFoodAllergies()
//                                }
//                            }
//                        }
//                    }

                    .navigationTitle("Profile")
                    .navigationBarTitleDisplayMode(.inline)
                    .onChange(of: photosItem) {
                        Task {
                            user.image = try? await photosItem?.loadTransferable(type: Data.self)
                        }
                    }
                }
            }
        }
    
    func addFavoriteFoods() {
        guard addFoodFavorites.isEmpty == false else { return }
        
        withAnimation {
            _ = FoodFavorites(name: addFoodFavorites)
            user.favFoods.append(FoodFavorites(name: addFoodFavorites))
            addFoodFavorites = ""
        }
    }
    func deleteFoodFavorites(_ indexSet: IndexSet) {
        for index in indexSet {
            let foods = sortedFoods[index]
            modelContext.delete(foods)
        }
    }
    
    func addFoodAllergies() {
        guard addAllergies.isEmpty == false else { return }
        
        withAnimation {
            _ = FoodAllergies(name: addAllergies, isSelected: true)
            user.allergies
                .append(FoodAllergies(name: addAllergies, isSelected: true))
            addAllergies = ""
            
        }
    }
    
    func deleteFoodAllergies(_ indexSet: IndexSet) {
        for index in indexSet {
            let allergies = sortedAllergies[index]
            modelContext.delete(allergies)
        }
    }
    func saveFoodPreferences() {
        try? modelContext.save()
    }
        
    }


#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(
            for: User.self,
            configurations: config
        )
        
        let example = User(name: "Username", details: "User food preferences go here.")
        return EditUserContent(user: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}

