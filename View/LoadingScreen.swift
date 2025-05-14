//
//  LoadingScreen.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 6/4/25.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(
                        colors: [.champagne, .tyrianPurple]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .opacity(0.5)
                .blendMode(.darken)
                .edgesIgnoringSafeArea(.all)
                Image("LoadingBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(edges: .all)
                    .opacity(0.05)
                NavigationLink(destination: SwipeView()) {
                    Image("LoadingScreenIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 349, height: 497)
                        .padding(.trailing, 30)
                        .foregroundColor(.white)
                        .onAppear {
                        }
                }
            }
        }
    }
}
    


#Preview {
    LoadingScreen()
}
