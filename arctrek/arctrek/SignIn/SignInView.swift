
import Foundation
import SwiftUI



struct SignInView: View {
  @StateObject var viewModel = SignInViewModel()

    @Binding var appUser: AppUser?
    
  let signInApple = SignInApple()
    
  var body: some View {
      
      Button {
          Task {
              do {
                  let appUser = try await viewModel.signInWithGoogle()
                  self.appUser = appUser
              } catch {
                  print("error to signing in")
              }
          }
      } label: {
          Text("Sign in with Google")
              .foregroundColor(.black)
      }
  }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(appUser: .constant(.init(uid: "1234", email: nil)))
    }
}
