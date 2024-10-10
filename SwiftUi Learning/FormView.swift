//
//  FormView.swift
//  SwiftUi Learning
//
//  Created by Yashom on 10/10/24.
//

import SwiftUI

struct FormView: View {
    @State private var name: String = ""
    @State private var noti: Bool = false
    @State private var age: Int = 10
    @State private var picked = "iPhone"
    let ar: [String] = ["Iphone", "Mac", "iWatch", "tablet"]
    @State private var showAlert = false
    var body: some View {
        Form{
            Section(header: Text("Information")){
                TextField("Enter your name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Stepper("Age \(age)", value: $age, in: 0...100)
                
                Toggle("Notification Toggle", isOn: $noti)
                Picker("Pick a device", selection: $picked){
                    ForEach(ar, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
            }
            
            Button("Submit"){
                if name.isEmpty{
                    showAlert = true
                }
            }
            
            .alert(isPresented: $showAlert){
                Alert(title: Text("Error"), message: Text("Name can't be empty"), dismissButton: .default(Text("Ok")))
            }
        }
        .navigationTitle("Form")
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
