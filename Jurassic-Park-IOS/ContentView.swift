//
//  ContentView.swift
//  Jurassic-Park-IOS
//
//  Created by jatin foujdar on 06/01/25.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    
    var body: some View {
        List(predators.apexPredators){ predator in
            HStack{
                Image(predator.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: .white, radius: 1)
                    .frame(width: 100,height: 100)
                VStack{
                    Text(predator.name)
                        .fontWeight(.bold)
                    
                    Text(predator.type.capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                }
                .padding()
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
