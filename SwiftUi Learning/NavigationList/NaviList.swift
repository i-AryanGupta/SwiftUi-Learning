//
//  NaviList.swift
//  SwiftUi Learning
//
//  Created by Yashom on 10/10/24.
//

import SwiftUI

struct NaviList: View {
    var arr: [String] = ["Iphone", "Mac", "iWatch", "tablet"]
    var body: some View {
        
        NavigationView{
            List{
                ForEach(arr, id: \.self){ items in
                    NavigationLink(destination: NaviDetail(devices: items), label: {Text(items)})
                }
                Text("hello")
                Text("bye")
            }
            .navigationTitle("Navi")
        }
    }
}

struct NaviDetail: View{
    
    var devices: String
    var body: some View{
        
        Text("Device \(devices)")
        
    }
}

struct NaviList_Previews: PreviewProvider {
    static var previews: some View {
        NaviList()
    }
}
