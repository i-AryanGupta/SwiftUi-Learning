//
//  DecodingJSON.swift
//  SwiftUi Learning
//
//  Created by Yashom on 11/10/24.
//

import SwiftUI

struct Item: Identifiable, Codable{
    let id: Int
    let name: String
}

struct DecodingJSON: View {
    
    @State private var items: [Item] = []
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.white]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack{
                List(items){ item in
                    Text(item.name)
                }.onAppear(perform: loadData)
            }
        }
    }
    
    func loadData(){
        if let url = Bundle.main.url(forResource: "generated", withExtension: "json"){
            do{
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                items = try decoder.decode([Item].self, from: data)
            } catch{
                print("Error \(Error.self)")
            }
        } else {
            print("file not found")
        }
    }

}

struct DecodingJSON_Previews: PreviewProvider {
    static var previews: some View {
        DecodingJSON()
    }
}
