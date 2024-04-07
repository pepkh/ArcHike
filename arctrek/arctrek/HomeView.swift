//
//  HomeView.swift
//  arctrek
//
//  Created by Karen Zhao on 2024-04-06.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @State var appUser: AppUser
    
    var body: some View {
        VStack {
            Text(appUser.uid)
            
            Text(appUser.email ?? "No Email")
            
            Button {
                Task {
                    do {
                        try await AuthManager.shared.signOut()
                    } catch {
                        print("unable to sign out")
                    }
                }
            } label: {
                Text("Sign out")
            }
        }
    }
}
