import Foundation
import SwiftUI
import UIKit


var exampleCustomer = Customer(name: "John Doe", gender: "Male", experience: "Intermediate", location: Location(city: "New York", country: "USA"))
// acts like the entry point
struct AppView: View {
    // will assign is authenticated variable
  @State var isAuthenticated = false
  
    

    
  var body: some View {
      let _: () = request(customer: Customer(name: "John Doe", gender: "Male", experience: "Intermediate", location: Location(city: "New York", country: "USA")))
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


struct Location: Codable {

    let city: String
    let country: String

}

struct Customer: Codable {

    let name: String
    let gender: String
    let experience: String
    let location: Location

}


//func request() {
//    let url = URL(string: "http://127.0.0.1:8000/customer")!
//    var request = URLRequest(url: url)
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        if let data = data {
//            if let clothes = try? JSONDecoder().decode([Customer].self, from: data) {
//                print(clothes)
//            } else {
//                print("Invalid Response")
//            }
//        } else if let error = error {
//            print("HTTP Request Failed \(error)")
//        }
//    }
//}
struct Products: Codable {
    
    let pid: Int
    let title: String
    let gender: String
    let image: URL
    let description: String
    let rating: Float
    let slug: URL
    
}

struct Jackets: Codable {
    
    let pid: Int
    let title: String
    let gender: String
    let image: URL
    let description: String
    let rating: Float
    let slug: URL
    
}

func request(customer: Customer) {
    let url = URL(string: "http://127.0.0.1:8000/customer")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // Convert Customer object to JSON data
    guard let jsonData = try? JSONEncoder().encode(customer) else {
        print("Failed to encode customer object")
        return
    }
    
    
    // Set HTTP body with JSON data
    request.httpBody = jsonData
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            do {
                // Parse JSON response into a single Customer object
                let customer = try JSONDecoder().decode(Products.self, from: data)
                print(customer)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else if let error = error {
            print("HTTP Request Failed \(error)")
        }
    }
    
    task.resume()
}
