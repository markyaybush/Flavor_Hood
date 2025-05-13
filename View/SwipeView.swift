//
//  SwipeView.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 4/30/25.
//

import SwiftUI

struct SwipeView: View {
    @StateObject var viewModel = RestaurantViewModel()
    @GestureState private var dragOffset = CGSize.zero

    var body: some View {
        VStack {
            Spacer(minLength: 100) // <-- pushes content downward

            // CARD STACK
            ZStack {
                ForEach(viewModel.restaurants.prefix(2).reversed()) { restaurant in
                    let isTopCard = viewModel.restaurants.first == restaurant

                    RestaurantCardView(restaurant: restaurant)
                        .frame(width: 260, height: 400)
                        .scaleEffect(isTopCard ? 1.0 : 0.98) // Less scaling = more visible
                        .offset(x: isTopCard ? dragOffset.width : 0, y: isTopCard ? dragOffset.height : 20) // Slight lift
                        .opacity(isTopCard ? 1.0 : 0.9) // Optional: peek-through layering
                        .rotationEffect(.degrees(isTopCard ? Double(dragOffset.width / 20) : 0))
                        .gesture(
                            isTopCard ?
                            DragGesture()
                                .updating($dragOffset) { value, state, _ in
                                    state = value.translation
                                }
                                .onEnded { value in
                                    if value.translation.width > 100 {
                                        viewModel.removeTopRestaurant()
                                    } else if value.translation.width < -100 {
                                        viewModel.removeTopRestaurant()
                                    }
                                }
                            : nil
                        )
                        .animation(.spring(), value: dragOffset)
                }
            }

            // DESCRIPTION BELOW CARD
            if let restaurant = viewModel.restaurants.first {
                Text("At \(restaurant.name), we bring the heart of \(restaurant.description)")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 40)
            }

            Spacer()

            // CENTER QUESTION BUTTON
            ZStack {
                HStack {
                    Spacer()
                }
                .frame(height: 80)

                Button(action: {
                    print("Question button tapped")
                }) {
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.purple)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
            }

            // BOTTOM NAVIGATION BAR
            HStack {
                Spacer()
                Image(systemName: "house")
                Spacer()
                Image(systemName: "mappin.and.ellipse")
                Spacer()
                Image(systemName: "star")
                Spacer()
                Image(systemName: "person")
                Spacer()
            }
            .font(.title3)
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .background(Color.white.ignoresSafeArea())
    }
}
    #Preview {
        SwipeView()
    }

