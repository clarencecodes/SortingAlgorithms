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
    
    @State private var pickerSelectedItem = 0
    
    var body: some View {
        VStack {
            
            Picker(selection: $pickerSelectedItem, label: Text("")) {
                Text("Bubble Sort").tag(0)
                Text("Quick Sort").tag(1)
                Text("Merge Sort").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 100)
                .padding(.bottom, 20)
            
            HStack {
                ForEach(numbers, id: \.self) { number in
                    Capsule().frame(width: 5, height: CGFloat(number))
                        .foregroundColor(.red)
                }
                
            }
            
            HStack {
                Button(action: {
                    switch self.pickerSelectedItem {
                    case 0:
                        self.bubbleSort()
                    default:
                        break
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
    
    private func bubbleSort() {
        for i in 0..<self.numbers.count {
            for j in 0..<(self.numbers.count - i - 1) {
                if self.numbers[j] > self.numbers[j+1] {
                    // Swap the two numbers
                    withAnimation() {
                        let temp = self.numbers[j]
                        self.numbers[j] = self.numbers[j+1]
                        self.numbers[j+1] = temp
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
