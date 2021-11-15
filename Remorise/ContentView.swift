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
                VStack(alignment: .leading) {
                    Text("Welcome,")
                        .foregroundColor(Color("Oxford Blue"))
                        .font(.system(size: 35.0, weight: .bold, design: .rounded))
                    
                    
                    Text("esteemed learner!")
                        .foregroundColor(Color("Azure"))
                        .font(.system(size: 35.0, weight: .bold,design: .rounded))
                }
                .padding()
                
                
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(Color("Oxford Blue"))
                        .font(.system(size: 30))
                }
                .padding()
                .frame(width: 50, height: 50)
                .background(Color("Beau Blue"))
                .clipShape(Circle())
                
            }
            // button cannot alignment leading pls help
                Button {
                    
                } label: {
                    Text("All")
                        .foregroundColor(Color("Oxford Blue"))
                        .font(.system(size: 20))
                
                }
                .padding()
                .frame(alignment: .leading)
                .background(Color("Beau Blue"))
                .cornerRadius(30)
            
            VStack {
                Text("No flashcards created yet")
                    .foregroundColor(Color("Oxford Blue"))
                    .font(.system(size: 25.0, design: .rounded))
                    .frame(width: 500, height: 625.3, alignment: .center)
                    
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

