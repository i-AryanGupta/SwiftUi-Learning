//
//  WorkingWithData.swift
//  SwiftUi Learning
//
//  Created by Yashom on 11/10/24.
//

import SwiftUI

struct WorkingWithData: View {
    @State private var username: String = UserDefaults.standard.string(forKey: "username") ?? ""
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.white]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack{
                
                TextField("Enter the username", text: $username)
                    .padding()
                    .textFieldStyle(.roundedBorder)
                Button("Submit"){
                    UserDefaults.standard.set(username, forKey: "username")
                    print("data saved using userdefault")
                    
                   username = UserDefaults.standard.string(forKey: "username") ?? ""
                    
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(20.0)
                
                let savedData = UserDefaults.standard.string(forKey: "username")
                if let saved = savedData{
                    Text("Saved data is \(saved)")
                        .background(Color.white)
                        .foregroundColor(Color.black)
                }
                
            }
        }
    }
}

struct WorkingWithData_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithData()
    }
}
