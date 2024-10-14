//
//  FetchFromApi.swift
//  SwiftUi Learning
//
//  Created by Yashom on 11/10/24.
//

import SwiftUI

struct Post: Codable, Identifiable{
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

struct FetchFromApi: View {
    @State private var posts: [Post] = []
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.white]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            NavigationView{
                
                List(posts){ post in
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Api Fetch")
            .onAppear(perform: loadApiData)
        }
    }
    
    func loadApiData() {
            // The URL of the API
            guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
                print("Invalid URL")
                return
            }

            // Create a data task to fetch the data
            URLSession.shared.dataTask(with: url) { data, response, error in
                // Check for any errors
                if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                    return
                }

                // Ensure we received valid data
                guard let data = data else {
                    print("No data received")
                    return
                }

                // Decode the JSON into an array of Post objects
                let decoder = JSONDecoder()
                do {
                    let decodedPosts = try decoder.decode([Post].self, from: data)

                    // Since we're updating the UI, we must do this on the main thread
                    DispatchQueue.main.async {
                        self.posts = decodedPosts
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
            .resume()
    }
}


struct FetchFromApi_Previews: PreviewProvider {
    static var previews: some View {
        FetchFromApi()
    }
}
