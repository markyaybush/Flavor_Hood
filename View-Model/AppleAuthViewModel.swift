//
//  AppleAuthViewModel.swift
//  Flavor_Hood
//
//  Created by MARK BUSH on 5/30/25.
//

import Foundation
import AuthenticationServices
import CryptoKit

class AppleAuthViewModel: NSObject, ObservableObject {
    @Published var isSignedIn = false
    @Published var alertMessage = ""
    @Published var showAlert = false

    private var currentNonce: String?

    func handleRequest(_ request: ASAuthorizationAppleIDRequest) {
        let nonce = randomNonceString()
        currentNonce = nonce
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
    }

    func handleCompletion(_ result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let auth):
            if let appleIDCredential = auth.credential as? ASAuthorizationAppleIDCredential {
                // You now have the user ID — save it in Keychain or authenticate to your backend
                let userId = appleIDCredential.user
                print("Signed in as: \(userId)")
                alertMessage = "Welcome! Signed in successfully."
                isSignedIn = true
            } else {
                alertMessage = "Apple ID Credential is missing."
            }

        case .failure(let error):
            alertMessage = "Sign in failed: \(error.localizedDescription)"
        }

        showAlert = true
    }
}
