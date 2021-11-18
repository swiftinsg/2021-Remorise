//
//  ContentView.swift
//  Remorise
//
//  Created by Trinity Lee on 14/11/21.
// Home Screen

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
   
            VStack(alignment: .leading) {
                ScrollView(.horizontal) {
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
                }
                .padding()
                
                Text("No flashcard stacks created yet, click the + button to start!")
                        .font(.system(size: 23, design: .rounded))
                        .frame(height: 200)
                        .multilineTextAlignment(.center)
                        .padding()
                    
            
                        
                
            }
            Spacer()
        }
        
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }


