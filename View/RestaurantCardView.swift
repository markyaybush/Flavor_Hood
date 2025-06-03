//
//  RestaurantCardView.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 4/30/25.
//

import SwiftUI

struct RestaurantCardView: View {
    let restaurant: Restaurant

    var body: some View {
        
        
        
        
        ZStack(alignment: .bottom) {
            Image(restaurant.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 260, height: 425) // Make the card narrower
                .clipped()
                .cornerRadius(25)
                .shadow(radius: 10)

            
            VStack(spacing: 8) {
                Text(restaurant.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
            }
            ZStack{
                
            }

               // Text(restaurant.description)
                 //   .font(.subheadline)
                   // .foregroundColor(.white)
                    //.multilineTextAlignment(.center)
                    //.shadow(radius: 2)
            
            .padding()
            .frame(maxWidth: .infinity)
            
            
            .cornerRadius(25)
        }
        .frame(width: 300, height: 400)
        .padding()
    }
}
struct RestaurantCardView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCardView(
            restaurant: Restaurant(
                name: "Cannelle",
                address: "1234 W Grand Blvd, Ann Arbor, MI 48104",
                imageName: "cannelle", // Make sure this image is in your Assets.xcassets
                description: "French bakery in Southeast Michigan.",
                priceLevel: 4
            )
        )
        .previewLayout(.sizeThatFits)
    }
}



