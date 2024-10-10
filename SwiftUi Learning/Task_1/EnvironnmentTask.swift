//
//  EnivormnentTask.swift
//  SwiftUi Learning
//
//  Created by Yashom on 09/10/24.
//

import SwiftUI

class UserProfile: ObservableObject{
    @Published var name: String = "Ankan"
    @Published var age: Int = 22

    
}

struct EparenetView: View{
    @StateObject var viewModel = UserProfile()
    var body: some View{
        NavigationView{
            
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                
                VStack(spacing: 20)
                {
                    NavigationLink(destination: EditProfileView(), label: {
                        Text("Edit Profile")
                            .font(.largeTitle)
                    })
                    .padding()
                    
                    ProfileView()
                }
                
            }
            .navigationTitle("ParentView")
        }
        .environmentObject(viewModel)
        
    }
}
struct  ProfileView: View{
    @EnvironmentObject var viewModel: UserProfile
    var body: some View{
        
        VStack (spacing: 10){
            Text("\(viewModel.name)")
                .font(.largeTitle)
                .foregroundColor(Color.black)
            
            Text("\(viewModel.age)")
                .font(.largeTitle)
                .foregroundColor(Color.black)
        }
    }
    
}

struct EditProfileView: View {
    @EnvironmentObject var viewModel: UserProfile
    
    var body: some View {
            Form {
                Section(header: Text("Edit Name")) {
                    TextField("Enter your name", text: $viewModel.name)
                }
                
                Section(header: Text("Edit Age")) {
                    Stepper(value: $viewModel.age, in: 0...100) {
                        Text("Age: \(viewModel.age)")
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .padding()
        }
}

struct Eparent_Preview: PreviewProvider{
    static var previews: some View{
        EparenetView()
    }
}

