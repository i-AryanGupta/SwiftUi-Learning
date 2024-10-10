//
//  FormViewTask.swift
//  SwiftUi Learning
//
//  Created by Yashom on 10/10/24.
//

import SwiftUI

struct FormViewTask: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var age: Int = 0
    @State private var showAlert = false
    @State private var notification: Bool = false
    @State private var bright: Double = 50
    @State private var favColor = "Red"
    
    private let col: [String] = ["Red", "Green", "Blue", "White", "Black", "Yellow"]
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.white]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Form{
                    Section(header: Text("User Data")){
                        TextField("Enter First name", text: $firstName)
                        TextField("Enter Last name", text: $lastName)
                        Stepper("Age \(age)", value: $age, in: 0...100)
                        Toggle("Notification Turn", isOn: $notification)
                            .toggleStyle(.switch)
                        Picker("Favourite Color", selection: $favColor){
                            ForEach(col, id: \.self){ Text($0)}
                        }
                        .pickerStyle(.wheel)
                        
                        Slider(value: $bright, in: 0...100)
                        Text("Brightness: \(Int(bright))")
                        
                        Button("Submit"){
                            if firstName.isEmpty || lastName.isEmpty{
                                showAlert = true
                            }
                            else{
                                print(firstName, lastName, age)
                            }
                        }
                        .alert(isPresented: $showAlert){
                            Alert(title: Text("Error"), message: Text("Name can't be empty"), dismissButton: .default(Text("Ok")))
                        }
                    }
                }
            }
        }
            
        
    }
}

struct FormViewTask_Previews: PreviewProvider {
    static var previews: some View {
        FormViewTask()
    }
}
