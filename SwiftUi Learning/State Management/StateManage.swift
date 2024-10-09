//
//  StateManage.swift
//  SwiftUi Learning
//
//  Created by Yashom on 08/10/24.
//

import SwiftUI

struct StateManage: View{
    
    @State private var count = 0 // store data to local view and drive change in UI
    
    var body: some View{
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                           startPoint: .topTrailing, endPoint: .bottomLeading)
              .ignoresSafeArea()
            
            VStack{
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor(Color.black)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50, alignment: .center)
                    .shadow(color: Color.black, radius: 5.0)
                    .padding()
                
                Text("Counter \(count)")
                    .font(.title)
                
                Button(action: { count += 1}){
                    Text("Increment")
                        .padding()
                        .font(.subheadline)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        
                }
            }
        }
    }
    
}

//struct StateMange_Preview: PreviewProvider{
//    static var previews: some View{
//        StateManage()
//    }
//}
