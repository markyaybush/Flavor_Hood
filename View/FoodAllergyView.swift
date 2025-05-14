//
//  FoodAllergyView.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 6/2/25.
//

import PhotosUI
import SwiftUI
import SwiftData

struct FoodAllergyView: View {
    @Environment(\.editMode) private var editMode
    @Environment(\.modelContext) private var modelContext
    @Bindable var user: User
    @Query private var userAllergy: [FoodAllergies]
    @Query private var selectedFoodAllergies: [SelectedAllergies]
    @State private var selection = Set<FoodAllergies>()
    
    let data = (1...32).map {"Item \($0)"}
    
    let columns = [
        GridItem(.adaptive(minimum: 125))
    ]
    
    let rows = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    
    let userFoodAllergy = ["Gluten", "Shellfish", "Peanuts", "Tree Nuts", "Eggs", "Dairy", "Soy", "Fish", "Wheat", "Sesame", "Lactose", "Strawberries", "Carrots",  "Sulphites", "Mustard", "Lupin", "Moluscs", "Soya", "Celery", "Garlic", "Avacados", "Kiwi", "Peaches", "Mushrooms", "Passionfruit", "Onions", "Chamomile", "Chocolate", "Other Allergies"].sorted()
    
    let allergy = [
        SelectedAllergies(category: .gluten),
        SelectedAllergies(category: .shellfish),
        SelectedAllergies(category: .peanuts),
        SelectedAllergies(category: .treeNuts),
        SelectedAllergies(category: .eggs),
        SelectedAllergies(category: .dairy),
        SelectedAllergies(category: .soy),
        SelectedAllergies(category: .fish),
        SelectedAllergies(category: .wheat),
        SelectedAllergies(category: .sesame),
        SelectedAllergies(category: .lactose),
        SelectedAllergies(category: .strawberries),
        SelectedAllergies(category: .carrots),
        SelectedAllergies(category: .sulphites),
        SelectedAllergies(category: .mustard),
        SelectedAllergies(category: .lupin),
        SelectedAllergies(category: .moluscs),
        SelectedAllergies(category: .soya),
        SelectedAllergies(category: .celery),
        SelectedAllergies(category: .garlic),
        SelectedAllergies(category: .avocados),
        SelectedAllergies(category: .kiwis),
        SelectedAllergies(category: .peaches),
        SelectedAllergies(category: .mushrooms),
        SelectedAllergies(category: .passionfruit),
        SelectedAllergies(category: .onions),
        SelectedAllergies(category: .chamomile),
        SelectedAllergies(category: .chocolate),
        SelectedAllergies(category: .otherAllergies)
    ]
    
    var body: some View {
        ZStack {
            Image("LoadingBackground")
                .resizable()
                .opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Food Allergies")
                        .font(Font.custom("SFCompact", size: 48))
                        .fontDesign(.rounded)
                        .foregroundColor(.tyrianPurple)
                        .bold(true)
                        .padding()
                    
                }
                Text("Select Allergens")
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
                        ForEach(selectedFoodAllergies, id: \.self) { allergen in
                            
                            Image("SelectionCapsule")
                                .overlay {
                                    ZStack {
                                        Text(allergen.category.rawValue)
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
                                    modelContext.delete(allergen)
                                }
                        }
                    }
                }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(allergy, id: \.self) { allergen in
                            Button {
                                modelContext.insert(allergen)
                            } label: {
                                Image("SelectionCapsule")
                                    .overlay {
                                        Text(allergen.category.rawValue)
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
            let allergen = selectedFoodAllergies[index]
            modelContext.delete(allergen)
        }
        
    }
}


#Preview {
    FoodAllergyView(user: User())
}
