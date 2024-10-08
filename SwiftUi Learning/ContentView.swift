//
//  ContentView.swift
//  SwiftUi Learning
//
//  Created by Yashom on 08/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                           startPoint: .topTrailing, endPoint: .bottomLeading)
              .ignoresSafeArea()
            
                
            VStack(alignment: .center){
                
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(Color.black)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 80, alignment: .center)
                    .shadow(color: Color.black, radius: 5.0)
                    .padding()
                
                Text("Aryan Gupta")
                    .padding()
                    .font(.title)
                    .foregroundColor(Color.black)
                
                Button(action: { print ("Button tapped!")
                    
                }) {
                    Text("Click me")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
