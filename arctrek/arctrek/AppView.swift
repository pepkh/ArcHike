
import Foundation
import SwiftUI

// acts like the entry point
struct AppView: View {


  var body: some View {
      SignInView(appUser: .constant(.init(uid: "1234", email: nil)))
      
  }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
