//
//  SwipeView.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 4/30/25.
//

import PhotosUI
import SwiftUI
import SwiftData

struct SwipeView: View {
    @StateObject var viewModel = RestaurantViewModel()
    @GestureState private var dragOffset = CGSize.zero
    @State private var navigateToDetail = false
    @State private var selectedRestaurant: Restaurant? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("LoadingBackground")
                    .opacity(0.02)
                
                VStack {
                    ZStack {
                        ForEach(viewModel.restaurants.prefix(2).reversed()) { restaurant in
                            let isTopCard = viewModel.restaurants.first == restaurant
                            
                            RestaurantCardView(restaurant: restaurant)
                                .frame(width: 260, height: 400)
                                .scaleEffect(isTopCard ? 1.0 : 0.98)
                                .offset(x: isTopCard ? dragOffset.width : 0,
                                        y: isTopCard ? dragOffset.height : 20)
                                .opacity(isTopCard ? 1.0 : 0.9)
                                .rotationEffect(.degrees(isTopCard ? Double(dragOffset.width / 20) : 0))
                                .gesture(
                                    isTopCard ?
                                    DragGesture()
                                        .updating($dragOffset) { value, state, _ in
                                            state = value.translation
                                        }
                                        .onEnded { value in
                                            if value.translation.width > 100 {
                                                // Swipe right — navigate
                                                selectedRestaurant = restaurant
                                                navigateToDetail = true
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                    viewModel.removeTopRestaurant()
                                                }
                                            } else if value.translation.width < -100 {
                                                // Swipe left — just remove
                                                viewModel.removeTopRestaurant()
                                            }
                                        }
                                    : nil
                                )
                                .animation(.spring(), value: dragOffset)
                        }
                    }
                    
                    HStack {
                        Spacer()
                    }
                    .frame(height: 80)
                    
                    VStack {
                        NavigationLink {
                            MysteryContentView(
                                mysteryFoodQuestion: MysteryFoodQuestion(
                                    question: "Flats or drums, we do our thing-- who run the city when it comes to wings?",
                                    answer: "Kingz of Wings"))
                        } label: {
                            Image("QMark")
                                .frame(width: 50, height: 50)
                                .shadow(radius: 4)
                        }
                    }
                    
//                    NavigationLink(
//                        destination: {
//                            switch selectedRestaurant {
//                            case .some(let restaurant):
//                                RestaurantDetailView(restaurant: restaurant)
//                            case .none:
//                                EmptyView()
//                            }
//                        },
//                        isActive: $navigateToDetail,
//                        label: {
//                            EmptyView()
//                        }
//                    )
//                    .hidden()
                }
            }
        }
    }
}
#Preview {
   SwipeView()
}
