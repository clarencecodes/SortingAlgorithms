//
//  ContentView.swift
//  SortingAlgorithms
//
//  Created by Clarence Chan on 9/1/20.
//  Copyright © 2020 clarencechan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = Array(1...50).shuffled()

    var body: some View {
        VStack {
            Text("Bubble Sort")
                .font(.title)
                .fontWeight(.heavy)
            
            HStack {
                // animations may not work with foreach loop
                ForEach(numbers, id: \.self) { number in
                    Capsule().frame(width: 5, height: CGFloat(number))
                        .foregroundColor(.red)
                }
                
            }
            
            Button(action: {
                // TODO: fix issue where algorithm only passes once
                
                for i in 0..<(self.numbers.count - 1) {
                    if self.numbers[i] > self.numbers[i + 1] {
                        // Swap the two numbers
                        let animation = Animation
                            .linear(duration: 0.2)
                            .delay(Double(i))
                        
                        withAnimation(animation) {
                            self.swap(indexA: i, indexB: i + 1)
                        }
                    }
                }
                
            }, label: {
                Text("Sort!")
            })
                .foregroundColor(Color.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(15)
            
        }
        
    }
    
    private func swap(indexA: Int, indexB: Int) {
        let temp = self.numbers[indexA]
        self.numbers[indexA] = self.numbers[indexB]
        self.numbers[indexB] = temp
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
