//
//  RestaurantDetailView.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 5/30/25.
//
import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant

    // Convert price level to string like $, $$, $$$, etc.
    var priceString: String {
        String(repeating: "$", count: restaurant.priceLevel)
    }

    var body: some View {
        ZStack {
            Color("lbackground").ignoresSafeArea()

            VStack(spacing: 16) {
                // Top bar: logo + camera icon
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding(.leading, 20)

                    Spacer()

                    Image("cam")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding(.trailing, 20)
                }
                .padding(.top, 40)

                // Restaurant name + address
                VStack(spacing: 4) {
                    Text(restaurant.name)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.mcolor)

                    Text(restaurant.address)
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.8))
                   
                    
                }

                // Image with price overlay
                ZStack(alignment: .topLeading) {
                    Image(restaurant.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .frame(width: 375, height: 420)

                    // Price overlay
                    Text(priceString)
                        .font(.caption)
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.white.opacity(0.85))
                        .background(.ultraThinMaterial)
                        .cornerRadius(8)
                        .foregroundColor(.black)
                        .padding([.top, .leading], 20)
                    
                    Image ("qmark")
                        .position(x: 190, y: 500)
                }

                Spacer()

                
                    }
                }
                .padding(.bottom, 30)
            }
        }
    


#Preview {
    RestaurantDetailView(restaurant: Restaurant(
        name: "Hudson Cafe",
        address: "1241 Woodward Ave, Detroit, MI 48226",
        imageName: "hudson_cafe_image",
        description: "Known for their legendary chicken and waffles.",
        priceLevel: 3
    ))
}
