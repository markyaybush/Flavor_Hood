//
//  SignInView.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 5/30/25.
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleView: View {
    @StateObject private var authViewModel = AppleAuthViewModel()

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.2), Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Spacer()

                ZStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.purple))
                        .scaleEffect(2)
                        .padding(40)

                    Image(systemName: "apple.logo")
                        .font(.system(size: 40))
                        .foregroundColor(.black)
                }

                Text("Apple ID")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)

                SignInWithAppleButton(.signIn, onRequest: { request in
                    authViewModel.handleRequest(request)
                }, onCompletion: { result in
                    authViewModel.handleCompletion(result)
                })
                .signInWithAppleButtonStyle(.black)
                .frame(height: 50)
                .cornerRadius(10)
                .padding(.horizontal)

                Text("Forgot your Apple Account or Password?")
                    .font(.footnote)
                    .foregroundColor(.gray)

                Spacer()

                HStack {
                    Spacer()
                    tabIcon(name: "house.fill", label: "Main")
                    Spacer()
                    tabIcon(name: "person.crop.circle", label: "Profile")
                    Spacer()
                    tabIcon(name: "map.fill", label: "Map")
                    Spacer()
                    tabIcon(name: "camera.fill", label: "Camera")
                    Spacer()
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(25)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            }
            .alert(isPresented: $authViewModel.showAlert) {
                Alert(title: Text("Sign In Status"), message: Text(authViewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    func tabIcon(name: String, label: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: name)
                .font(.system(size: 22))
                .foregroundColor(.purple)
            Text(label)
                .font(.caption)
                .foregroundColor(.purple)
        }
    }
}

#Preview {
    SignInWithAppleView()
}

