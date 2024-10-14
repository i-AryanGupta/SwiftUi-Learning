//
//  EnivornmentObjectBoot.swift
//  SwiftUi Learning
//
//  Created by Yashom on 09/10/24.
//

import SwiftUI

class EnivornmentObjectViewModel: ObservableObject{
    
    @Published var dataArray: [String] = []
    
    init(){
        getData()
    }
    
    func getData(){
        
        self.dataArray.append(contentsOf: ["Razor", "Allienware", "Predator"])
    }
}

struct EnivornmentObjectBoot: View {
    @StateObject var viewModel = EnivornmentObjectViewModel() // as soon as intitalizes the init() called it called getData() and append data into dataArray
    // now we can access data through viewModel
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.dataArray, id: \.self ) { item in
                    NavigationLink(destination: DetailView(selectedItem: item), label: {Text(item)})
                    
                }
            }
            .navigationTitle("Laptops")
        }
        // WE taking the above viewModel and putting inside the below
        .environmentObject(viewModel)
    }
}

struct DetailView: View{
    let selectedItem: String
    // we didn't  use it just we use for passing in the next view
   // @ObservedObject var viewModel: EnivornmentObjectViewModel
    // we don't if we using @EnivornmentObject
    
    var body: some View{
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.white]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            NavigationLink(destination: FinalView(), label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(Color.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)}
            )
            
        }
    }
    
}

struct FinalView: View{
    
    @EnvironmentObject var viewModel: EnivornmentObjectViewModel
    
    // so we didn't create new model, instead we pass the viewModel through hierarchy
    // it is great but when we have 5 or more views then it annoting plus repeatative to use @ObservedObject
    //@ObservedObject var viewModel: EnivornmentObjectViewModel
    
     
    var body: some View{
        
        ZStack{
            // background
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.white]),
                           startPoint: .topTrailing, endPoint: .bottomLeading)
              .ignoresSafeArea()
            
            //foreground
            ScrollView{
                VStack(spacing: 20){
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}

struct EnivornmentObjectBoot_Previews: PreviewProvider {
    static var previews: some View {
        EnivornmentObjectBoot()
    }
}
