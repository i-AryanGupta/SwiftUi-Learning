//
//  AnimationView.swift
//  SwiftUi Learning
//
//  Created by Yashom on 10/10/24.
//

import SwiftUI

struct AnimationView: View {
    @State private var isVisible = false
    @State private var scale: CGFloat = 1.0
    @State private var rotation: CGFloat = 0.0
    var body: some View {
        HStack{
            Button("Earn Reward"){
                withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0)){
                    isVisible.toggle()
                    scale = scale == 1.0 ? 0.5 : 1.0
                    rotation = 5
                }
            }
            
            if isVisible{
                Text("Brokee get some help!!")
                    .font(.largeTitle)
                    .foregroundColor(Color.black)
                    .background(Color.yellow)
                    .opacity(isVisible ? 1 : 0)
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
                    .animation(.easeInOut(duration: 2), value: isVisible)
                    .transition(.scale)
            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
