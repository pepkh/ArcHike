//
//  AuthManager.swift
//  arctrek
//
//  Created by Karen Zhao on 2024-04-06.
//

import Foundation
import Supabase

struct AppUser {
    let uid: String
    let email: String?
}

class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://xybfaozzukgnheeudlzo.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh5YmZhb3p6dWtnbmhlZXVkbHpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTI0MzQzMDYsImV4cCI6MjAyODAxMDMwNn0.sjBatcvjHuNt3rBMH-sTzDbPhaoRITXJZdgO2ZddZxA")
    func getCurrentSession() async throws -> AppUser {
        let session = try await client.auth.session
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    func signInWithApple(idToken: String, nonce: String) async throws {
        _ = try await client.auth.signInWithIdToken(credentials: .init(provider: .apple, idToken: idToken, nonce: nonce))
    }
    
    func signInWithGoogle(idToken: String, nonce: String) async throws -> AppUser {
        let session = try await client.auth.signInWithIdToken(credentials: .init(provider: .google, idToken: idToken, nonce: nonce))
        print(session)
        print(session.user)
        return AppUser(uid: session.user.id.uuidString, email: session.user.email)
    }
    
    func signOut() async throws {
        try await client.auth.signOut()
    }
}
