//
//  ContentView.swift
//  SortingAlgorithms
//
//  Created by Clarence Chan on 9/1/20.
//  Copyright © 2020 clarencechan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let numbers = Array(1...50).shuffled()
        
    var body: some View {
        VStack {
            Text("Bubble Sort")
                .font(.title)
                .fontWeight(.heavy)
            
            HStack {
                // animations may not work with foreach loop
                ForEach(numbers, id: \.self) { number in
                    Capsule().frame(width: 5, height: CGFloat(number*3))
                    .foregroundColor(.red)
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
