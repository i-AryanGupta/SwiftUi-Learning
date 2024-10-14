//
//  FetchApiTask.swift
//  SwiftUi Learning
//
//  Created by Yashom on 11/10/24.
//

import SwiftUI

// Root object returned from the API
struct UserResponse: Decodable {
    let results: [User]
}

// User model based on the RandomUser API structure
struct User: Decodable, Identifiable {
    var id: String {
        email // Using email as the unique identifier
    }
    
    let firstName: String
    let lastName: String
    let username: String
    let email: String
    let phone: String
    let profileImageURL: String

    // Mapping the nested structure of the API response
    enum CodingKeys: String, CodingKey {
        case name, login, email, phone, picture
    }

    // Define custom keys for nested objects
    enum NameKeys: String, CodingKey {
        case first
        case last
    }

    enum LoginKeys: String, CodingKey {
        case username
    }

    enum PictureKeys: String, CodingKey {
        case large
    }

    // Custom initializer to decode nested structures
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode the nested name object for firstName and lastName
        let nameContainer = try container.nestedContainer(keyedBy: NameKeys.self, forKey: .name)
        self.firstName = try nameContainer.decode(String.self, forKey: .first)
        self.lastName = try nameContainer.decode(String.self, forKey: .last)

        // Decode the nested login object for username
        let loginContainer = try container.nestedContainer(keyedBy: LoginKeys.self, forKey: .login)
        self.username = try loginContainer.decode(String.self, forKey: .username)

        // Decode non-nested email and phone
        self.email = try container.decode(String.self, forKey: .email)
        self.phone = try container.decode(String.self, forKey: .phone)

        // Decode the nested picture object for profile image URL
        let pictureContainer = try container.nestedContainer(keyedBy: PictureKeys.self, forKey: .picture)
        self.profileImageURL = try pictureContainer.decode(String.self, forKey: .large)
    }
}



struct UserImageView: View {
    let imageURL: String

    var body: some View {
        // Use AsyncImage to load the image from the URL
        AsyncImage(url: URL(string: imageURL)) { phase in
            if let image = phase.image {
                // If the image loads successfully, display it
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())  // Makes the image circular
            } else if phase.error != nil {
                // If there was an error, display a placeholder or error message
                Text("Failed to load image")
                    .foregroundColor(.red)
            } else {
                // struct , While the image is loading, show a ProgressView
                ProgressView()
            }
        }
    }
}


struct FetchApiTask: View {
    @State private var users:[User] = []
    
    var body: some View {
        
        NavigationView{
            List(users){ user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    VStack{
                        HStack(spacing: 10){
                            UserImageView(imageURL: user.profileImageURL)
                            Text("\(user.firstName) \(user.lastName)")
                                .font(.largeTitle)
                        }
                        
                        Text("\(user.username) email: \(user.email)")
                            .font(.subheadline)
                    }
                }
                
            }
        }
        .navigationTitle("User Data")
        .onAppear(perform: UserDataLoad)
    }
    
    func UserDataLoad(){
        guard let url = URL(string: "https://randomuser.me/api/?results=25") else{
            print("link incorrect")
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }

            // Ensure we received valid data
            guard let data = data else {
                print("No data received")
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do{
                // Correctly decode into UserResponse, which contains the "results" array
                let decodedResponse = try decoder.decode(UserResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.users = decodedResponse.results // Assign the users from the results array
                }
            } catch {
                print("Exception caught in catch block: \(error.localizedDescription)")
            }
        }
        .resume()
    }

}


struct UserDetailView: View{
    let user:  User
    var body: some View{
        VStack {
            UserImageView(imageURL: user.profileImageURL)  // Show large profile image
                .frame(width: 150, height: 150)
                .padding()
            
            Text("\(user.firstName) \(user.lastName)")
                .font(.largeTitle)
                .padding(.bottom, 10)
            
            Text("Username: \(user.username)")
                .font(.headline)
                .padding(.bottom, 5)
            
            Text("Email: \(user.email)")
                .font(.subheadline)
                .padding(.bottom, 5)
            
            Text("Phone: \(user.phone)")
                .font(.subheadline)
                .padding(.bottom, 5)
            
            Spacer()
        }
        .navigationTitle("User Profile")
        .padding()
    }
}

struct FetchApiTask_Previews: PreviewProvider {
    static var previews: some View {
        FetchApiTask()
    }
}
