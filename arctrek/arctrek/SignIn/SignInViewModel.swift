//
//  SignInViewModel.swift
//  arctrek
//
//  Created by Karen Zhao on 2024-04-06.
//

import Foundation
import GoogleSignIn
import CryptoKit

class SignInViewModel: ObservableObject {
    let signInApple = SignInApple()
    
    func signInWithGoogle() async throws -> AppUser{
        let signInGoogle = await SignInGoogle()
        let googleResult = try await signInGoogle.startSignInWithGoogleFlow()
        return try await AuthManager.shared.signInWithGoogle(idToken: googleResult.idToken, nonce: googleResult.nonce)
    }

}


struct SignInGoogleResult {
    let idToken: String
    let nonce: String
}

@MainActor
class SignInGoogle {
    
    func startSignInWithGoogleFlow() async throws -> SignInGoogleResult {
        try await withCheckedThrowingContinuation({ [weak self] continuation
            in self?.signInWithGoggleFlow { result in
                continuation.resume(with: result)
            }
        })
    }
    
    func signInWithGoggleFlow(completion: @escaping (Result<SignInGoogleResult, Error>) -> Void) {
        guard let topVC = UIApplication.getTopViewController() else {
            completion(.failure(NSError()))
            return
        }
        let nonce = randomNonceString()
        GIDSignIn.sharedInstance.signIn(withPresenting: topVC) { signInResult, error in
            guard let user = signInResult?.user, let idToken = user.idToken else {
                completion(.failure(NSError()))
                return
            }
            print(user)
            completion(.success(.init(idToken: idToken.tokenString, nonce: nonce)))
            
        }
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            // Pick a random character from the set, wrapping around if needed.
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
    
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
}
