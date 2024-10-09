//
//  BindingManage.swift
//  SwiftUi Learning
//
//  Created by Yashom on 08/10/24.
//

import SwiftUI

struct ParentView: View{
    
    @State private var isToggled = false
    var body: some View{
        VStack{
            
            BindingManage(isToggled: $isToggled)
            Text(isToggled ? "Toggle is on": "Toggle is off")
                .font(.headline)
        }
        
    }
}

struct BindingManage: View{
    
    @Binding var isToggled: Bool
    var body: some View{
        
        Toggle("Switch", isOn: $isToggled)
            .padding()
    }
}

struct Binding_Preview: PreviewProvider{
    static var previews: some View{
        ParentView()
    }
}
