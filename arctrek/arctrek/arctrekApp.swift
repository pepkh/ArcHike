//
//  arctrekApp.swift
//  arctrek
//
//  Created by Sabrina Lou on 2024-04-06.
//

import SwiftUI
import GoogleSignIn

@main
struct arctrekApp: App {
    var body: some Scene {
        WindowGroup {
          AppView()
            // ...
                .onOpenURL { url in
                  GIDSignIn.sharedInstance.handle(url)
                }
        }
      }
}
