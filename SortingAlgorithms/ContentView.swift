//
//  ContentView.swift
//  SortingAlgorithms
//
//  Created by Clarence Chan on 9/1/20.
//  Copyright © 2020 clarencechan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var numbers = Array(1...20)
        .map { $0 * 5 }
        .shuffled()
    
    var body: some View {
        VStack {
            Text("Bubble Sort")
                .font(.title)
                .fontWeight(.heavy)
            
            HStack {
                ForEach(numbers, id: \.self) { number in
                    Capsule().frame(width: 5, height: CGFloat(number))
                        .foregroundColor(.red)
                }
                
            }
            
            HStack {
                Button(action: {
                    for i in 0..<self.numbers.count {
                        for j in 0..<(self.numbers.count - i - 1) {
                            if self.numbers[j] > self.numbers[j + 1] {
                                // Swap the two numbers
                                withAnimation() {
                                    self.swap(indexA: j, indexB: j + 1)
                                }
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
                
                Button(action: {
                    withAnimation() {
                        self.numbers = self.numbers.shuffled()
                    }
                }, label: {
                    Text("Shuffle!")
                })
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
            }
            
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
