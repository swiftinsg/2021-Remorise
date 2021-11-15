//
//  ContentView.swift
//  Remorise
//
//  Created by Trinity Lee on 14/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("Welcome, esteemed learner!")
                Image("hi")
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                    .scaledToFit()
                    .aspectRatio( contentMode: ContentMode.fit)
                    .frame(width: 30, height: 30)
            }
            HStack {
                ZStack {
                    RoundedRectangle (cornerRadius: 30)
                        .fill(Color.blue)
                        .frame(width: 40, height: 40, alignment: .top
                    )
                    Text("All")
                }
                
                .padding(0.0)
                
            }
            VStack {
                Text("No flashcards created yet")
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}

