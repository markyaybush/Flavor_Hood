//
//  UserProfile.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/30/25.
//

import PhotosUI
import SwiftUI
import SwiftData

struct AllergySheetView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var User: User
    
    
    var body: some View {
        FoodAllergyView(user: User)
        Button("Dismiss") {
            dismiss()
        }
        .font(Font.custom("SFCompact", size: 15))
        .font(.headline)
        .fontDesign(.rounded)
        .bold(true)
        .padding()
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .foregroundColor(.champagne)
        .tint(Color.tyrianPurple)
    }
}


struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var User: User
    @State private var isSelected: Bool = false
    
    var body: some View {
        FoodPreferenceView(user: User)
        Button("Dismiss") {
            dismiss()
        }
        .font(Font.custom("SFCompact", size: 15))
        .font(.headline)
        .fontDesign(.rounded)
        .bold(true)
        .padding()
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .foregroundColor(.champagne)
        .tint(Color.tyrianPurple)
    }
        
}

struct UserProfile: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var user: User
    @Query var food: [FoodPreferences] = []
    @Query private var selectedFoodPreference: [SelectedFoodPreferences]
    @Query private var selectedFoodAllergies: [SelectedAllergies]
    
    @State private var showingSheet = false
    @State private var isShowingSheet = false
    @State private var photosItem: PhotosPickerItem?
    
    let photos = Array(repeating: ["food1", "food2", "food3"], count: 2).flatMap { $0 }
    let columns = [
        GridItem(.adaptive(minimum: 125))
    ]
    
    let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Header
            VStack(spacing: 8) {
                Spacer().frame(height: 30)
                
                if let imageData = user.image {
                    if let image = UIImage(data: imageData) {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                    }
                }
                
                PhotosPicker("Attach photo", selection: $photosItem, matching: .images)
                
                TextField("Name", text: $user.name)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 20)
                TextField("Location", text: $user.details)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading, 20)
            }
            .onChange(of: photosItem) {
                Task {
                    user.image = try? await photosItem?.loadTransferable(type: Data.self)
                }
            }
            Spacer()
            .background(
                Image("LoadingBackground")
                    .frame(width: 523, height: 824)
                    .opacity(0.02)
            )
            
            Button("Food Preferences") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SheetView(User: user)
            }
            LazyVGrid(columns: columns, spacing: 20) {
                //                        ForEach(userFoodPreferences, id: \.self) { preference in
                ForEach(selectedFoodPreference, id: \.self) { pref in
                    Button {
                        //modelContext.insert(pref)
                    } label: {
                        Image("SelectionCapsule")
                            .overlay{
                                //Text(preference)
                                Text(pref.category.rawValue)
                                    .font(.caption2)
                                    .foregroundStyle(.champagne)
                            }
                    }
                }
            }
            Spacer(minLength: 40)
            
            Button("Allergies") {
                isShowingSheet.toggle()
            }
            .sheet(isPresented: $isShowingSheet) {
                AllergySheetView(User: user)
            }
            
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(selectedFoodAllergies, id: \.self) { allergen in
                    Button {
                    } label: {
                        Image("SelectionCapsule")
                            .overlay {
                                Text(allergen.category.rawValue)
                                    .font(.caption2)
                                    .foregroundStyle(.champagne)
                            }
                    }
                }
            }
            
            // MARK: - Photo Grid
            
            ScrollView {
                Spacer(minLength: 80)
                PhotosView()
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                    ForEach(photos.indices, id: \.self) { index in
                        Image(photos[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110, height: 110)
                            .clipped()
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

#Preview {
    UserProfile(user: User())
}
