//
//  ContentView.swift
//  CarAnimationSwiftUI
//
//  Created by Shamshad Akhtar on 02/10/24.
//

import SwiftUI

struct CarAnimation: View {
    @State private var animated = false
    
    let animations: [(String,Animation)] = [
        ("linear", .linear(duration: 3)), // Set 5 seconds duration
        ("ease", .easeInOut(duration: 3)), // Set 5 seconds duration
        ("ease-in", .easeIn(duration: 3)), // Set 5 seconds duration
        ("ease-out", .easeOut(duration: 3)), // Set 5 seconds duration
        ("ease-in-out", .easeInOut(duration: 3)), // Set 5 seconds duration
        ("spring", .spring(response: 3, dampingFraction: 0.3, blendDuration: 0.5)), // Spring with 5 seconds response
        ("cubic-bezier", Animation.timingCurve(0.1, 0.8, 0.2, 1, duration: 3)), // Set 5 seconds duration
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Car Animations")
                .font(.title)
                .bold()
                .foregroundColor(.teal)
                .padding()
                .underline()
                .frame(height: 80)
            
            ForEach(animations, id: \.0) { animation in
                HStack(alignment: .top, spacing: 8) {
                    Text(animation.0)
                        .font(.system(size: 16, weight: .bold))
                        .frame(width: 100, alignment: .leading)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // Car running on road
                    VStack(alignment: .leading) {
                        // Car emoji, positioned on the road
                        Text("🛻")
                            .font(.title)
                            .scaleEffect(x: -3, y: 2) // Flips the car to face the right
                            .offset(x: animated ? 200 : 0, y: 10) // Car moves along the road
                            .animation(animation.1, value: animated)
                        
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 250, height: 3) // Road with fixed width
                    }
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            // Animate button
            Button("Animate") {
                animated.toggle()
            }
            .font(.title)
            .frame(width: 150, height: 40)
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(20.0)
        }
        .padding(.all, 20) // Padding around the entire view
        .background(Color.black)
    }
}

#Preview {
    CarAnimation()
}
