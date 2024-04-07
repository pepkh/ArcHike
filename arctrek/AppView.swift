//
//  AppView.swift
//  arctrek
//
//  Created by Karen Zhao on 2024-04-06.
//

import Foundation
import SwiftUI

// acts like the entry point
struct AppView: View {
    // will assign is authenticated variable
  @State var isAuthenticated = false

  var body: some View {
    Group {
      if isAuthenticated {
        ProfileView()
      } else {
        AuthView()
      }
    } // reaches out to supabase authentication and listens to change
    .task {
      for await state in await supabase.auth.authStateChanges {
        if [.initialSession, .signedIn, .signedOut].contains(state.event) {
          isAuthenticated = state.session != nil
        }
      }
    }
  }
}
