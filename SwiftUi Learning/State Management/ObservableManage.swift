//
//  ObservableManage.swift
//  SwiftUi Learning
//
//  Created by Yashom on 08/10/24.
//

import SwiftUI
import Combine

// need conform this protocol
class CounterModel: ObservableObject{
    // @Published: Used on properties within an ObservableObject to notify any views when the property changes.
    @Published var count = 0
}

struct ObservableManage: View{
    //@ObservableObject: Used on classes to indicate that it contains data that can change.
    @ObservedObject private var counterModedl = CounterModel()
    
    var body: some View{
        
        VStack{
            
            Text("Count \(counterModedl.count)")
                .font(.headline)
            
            Button(action: {
                counterModedl.count += 1
            }){
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

struct Preview_Counter: PreviewProvider{
    static var previews: some View{
        ObservableManage()
    }
}
