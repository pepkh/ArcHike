//
//  AuthView.swift
//  arctrek
//
//  Created by Karen Zhao on 2024-04-06.
//

import Foundation
import SwiftUI
import Supabase

struct AuthView: View {
  @State var email = ""
  @State var isLoading = false
  @State var result: Result<Void, Error>?

  var body: some View {
      let color1 = hex(hex: "#D9D9D9")
      Image("arctrek")
          .resizable()
          .frame(width: 280, height: 230)
          .aspectRatio(contentMode: .fill)
          .position(x: 200, y: 270)
      
      VStack{
          VStack {
              Form {
                Section {
                  TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                } .listRowBackground(color1)

                Section {
                  Button("Sign in") {
                    signInButtonTapped()
                  }.multilineTextAlignment(.center)
                    if isLoading {
                        ProgressView()
                    }
                    if let result {
                      Section {
                        switch result {
                        case .success:
                          Text("Check your inbox.")
                        case .failure(_):
                          Text("Please enter an email").foregroundStyle(.red)
                        }
                      }
                    }
                }.listRowBackground(color1)
                  
                
              }.foregroundColor(.black)
                  .position(x: 200, y: 270)

              .scrollContentBackground(.hidden)
              .onOpenURL(perform: { url in
                Task {
                  do {
                    try await supabase.auth.session(from: url)
                  } catch {
                    self.result = .failure(error)
                  }
                }
              })
          }

      }.frame(maxWidth: .infinity, maxHeight: .infinity)
          .ignoresSafeArea(.all)
          .edgesIgnoringSafeArea(.all)
      
      
    
  }

  func signInButtonTapped() { // reaches to supabase
    Task {
      isLoading = true
      defer { isLoading = false }

      do {
          // will send a url to the email
        try await supabase.auth.signInWithOTP(
            email: email,
            redirectTo: URL(string: "io.supabase.user-management://login-callback")
        )
          // we need to add this schema to the app so the app knows how to redirect back to it
        result = .success(())
      } catch {
        result = .failure(error)
      }
    }
  }
}

func hex (hex:String) -> Color {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return Color.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return Color(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0
        
    )
}

