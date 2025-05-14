//
//  FoodPreferenceView.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/28/25.
//

import PhotosUI
import SwiftUI
import SwiftData

struct FoodPreferenceView: View {
    @Environment(\.editMode) private var editMode
    @Environment(\.modelContext) private var modelContext
    @Bindable var user: User
    @Query private var userFoodPreference: [FoodPreferences]
    @Query private var selectedFoodPreference: [SelectedFoodPreferences]
    @State private var selection = Set<FoodPreferences>()
    
    let data = (1...32).map {"Item \($0)"}
    
    let columns = [
        GridItem(.adaptive(minimum: 125))
    ]
    
    let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    
    let userFoodPreferences = ["Italian", "Japanese", "Chinese", "Indian", "Mexican", "Thai", "Greek", "Middle Eastern", "American", "French", "Vietnamese", "Peruvian", "Moroccan", "Cuban", "Spanish", "Russian", "Turkish", "Brazilian", "Nigerian", "Carribean", "Indonesian", "Kenyan", "South African", "Polish", "Korean", "Vegan", "Gluten Free", "Vegetarian", "Dairy Free", "Other Preferences", "Mongolian", "European"].sorted()
    
    let fp = [
        SelectedFoodPreferences(category: .italian),
        SelectedFoodPreferences(category: .japanese),
        SelectedFoodPreferences(category: .chinese),
        SelectedFoodPreferences(category: .indian),
        SelectedFoodPreferences(category: .mexican),
        SelectedFoodPreferences(category: .thai),
        SelectedFoodPreferences(category: .greek),
        SelectedFoodPreferences(category: .middleEastern),
        SelectedFoodPreferences(category: .american),
        SelectedFoodPreferences(category: .french),
        SelectedFoodPreferences(category: .vietnamese),
        SelectedFoodPreferences(category: .peruvian),
        SelectedFoodPreferences(category: .morroccan),
        SelectedFoodPreferences(category: .cuban),
        SelectedFoodPreferences(category: .spanish),
        SelectedFoodPreferences(category: .russian),
        SelectedFoodPreferences(category: .turkish),
        SelectedFoodPreferences(category: .brazillian),
        SelectedFoodPreferences(category: .nigerian),
        SelectedFoodPreferences(category: .carribean),
        SelectedFoodPreferences(category: .indonesian),
        SelectedFoodPreferences(category: .kenyan),
        SelectedFoodPreferences(category: .southAfrican),
        SelectedFoodPreferences(category: .polish),
        SelectedFoodPreferences(category: .korean),
        SelectedFoodPreferences(category: .vegan),
        SelectedFoodPreferences(category: .glutenFree),
        SelectedFoodPreferences(category: .vegetarian),
        SelectedFoodPreferences(category: .dairyFree),
        SelectedFoodPreferences(category: .otherPreferences),
        SelectedFoodPreferences(category: .mongolian),
        SelectedFoodPreferences(category: .european)
    ]
    
    
//    var sortedFoods: [FoodFavorites] {
//        user.favFoods.sorted {
//            $0.name < $1.name
//        }
//    }
    
    var body: some View {
        ZStack {
            Image("LoadingBackground")
                .resizable()
                .opacity(0.02)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Food Preferences")
                        .font(Font.custom("SFCompact", size: 48))
                        .fontDesign(.rounded)
                        .foregroundColor(.tyrianPurple)
                        .bold(true)
                        .padding()
                    
                }
                Text("Select your dietary preferences")
                    .font(Font.custom("SFCompact", size: 24))
                    .fontDesign(.rounded)
                    .foregroundStyle(.tyrianPurple)
                    .padding(.bottom, 125)
                
                Button {
                    selection.removeAll()
                } label: {
                    Image("SelectionCapsule")
                        .overlay {
                            Text("Clear Selection")
                                .font(.caption2)
                                .foregroundStyle(.white)
                        }
                        }
                Spacer()
                
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, alignment: .center) {
//                        ForEach (Array(selection), id: \.self) { selected in
                        ForEach(selectedFoodPreference, id: \.self) { pref in
                            
                            Image("SelectionCapsule")
                                .overlay {
                                    ZStack {
//                                        Text(selected.name)
                                        Text(pref.category.rawValue)
                                            .font(.caption2)
                                            .foregroundStyle(.champagne)
                                        Image(systemName: "xmark.circle.fill")
                                            .font(.headline)
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(.white, .red)
                                            .offset(x: 55, y: -18)
                                    }
                                }
                                .onTapGesture {
                                    modelContext.delete(pref)
                                }
                            }
                        }
                    }
    
                ScrollView {
                    //                Spacer(minLength: 1150)
                    LazyVGrid(columns: columns, spacing: 20) {
//                        ForEach(userFoodPreferences, id: \.self) { preference in
                        ForEach(fp, id: \.self) { pref in
                            Button {
                                modelContext.insert(pref)
                            } label: {
                                Image("SelectionCapsule")
                                    .overlay{
//                                        Text(preference)
                                        Text(pref.category.rawValue)
                                            .font(.caption2)
                                            .foregroundStyle(.champagne)
                                    }
                            }
                        }
                        .padding(.vertical)
                    }
                }
            }
            
        }
    }

    func deleteSelectedPreference(_ indexSet: IndexSet) {
        for index in indexSet {
            let pref = selectedFoodPreference[index]
            modelContext.delete(pref)
        }
        
    }
}




#Preview {
    FoodPreferenceView(user: User())
}
