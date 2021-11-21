//
//  ContentView.swift
//  Remorise
//
//  Created by Trinity Lee on 14/11/21.
// Home Screen

import SwiftUI


struct ContentView: View {
    @State private var showActiveRecallScreen = false
    @ObservedObject private var flashcardManager = FlashcardManager()
    @State private var isFlashcardPresented = false
    @State private var viewFlashcardStackScreen = false
    @State private var currentFlashcard: Int = 0
    
    
    
    var body: some View {
        VStack {
            
            HStack
            {
                VStack(alignment: .leading)
                {
                    Text("Welcome,")
                        .foregroundColor(Color("Oxford Blue"))
                        .font(.system(size: 35.0, weight: .bold, design: .rounded))
                    
                    
                    Text("esteemed learner!")
                        .foregroundColor(Color("Azure"))
                        .font(.system(size: 35.0, weight: .bold,design: .rounded))
                }
                .padding()
                
                Button
                {
                    isFlashcardPresented = true
                    
                }
            label:
                {
                    Image(systemName: "plus")
                        .foregroundColor(Color("Oxford Blue"))
                        .font(.system(size: 30))
                    
                }
                
                
                .padding()
                .frame(width: 50, height: 50)
                .background(Color("Beau Blue"))
                .clipShape(Circle())
                
            } // HStack
            // button cannot alignment leading pls help
            
            ScrollView(.horizontal)
            {
                HStack(spacing:9)
                {
                    Button
                    {
                        
                    } label:
                    {
                        Text("All")
                            .foregroundColor(Color("Oxford Blue"))
                            .font(.system(size: 20))
                        
                    }
                    .padding()
                    .frame(alignment: .leading)
                    .background(Color("Beau Blue"))
                    .cornerRadius(30)
                    
                    Button
                    {
                        
                    } label:
                    {
                        Text("#science")
                            .foregroundColor(Color("Oxford Blue"))
                            .font(.system(size: 20))
                        
                    }
                    .padding()
                    .frame(alignment: .leading)
                    .background(Color("Beau Blue"))
                    .cornerRadius(30)
                    
                    
                    Button
                    {
                        
                    } label:
                    {
                        Text("#geography")
                            .foregroundColor(Color("Oxford Blue"))
                            .font(.system(size: 20))
                        
                    }
                    .padding()
                    .frame(alignment: .leading)
                    .background(Color("Beau Blue"))
                    .cornerRadius(30)
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                ForEach(flashcardManager.flashcardStacks) { stack in
                    
                    
                    
                    ZStack(alignment: .topLeading)
                    {
                        RoundedRectangle(cornerRadius: 25,style: .continuous)
                            .fill(Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)))
                            .frame(maxWidth: .infinity)
                        Group {
                            HStack {
                                Spacer()
                                Menu {
                                    Button(action: {
                                        showActiveRecallScreen = true
                                        
                                    }) {
                                        Label("Quiz!", systemImage: "arrowtriangle.forward.fill")
                                    }
                                    Button(action: {
                                        viewFlashcardStackScreen = true
                                    }) {
                                        Label("Review", systemImage: "book.fill")
                                    }
                                    Button(action: {
                                        
                                    }) {
                                        Label("Edit", systemImage: "pencil")
                                    }
                                } label: {
                                    Image(systemName: "list.bullet")
                                }
                                .padding()
                            }
                            
                            VStack(alignment:.leading)
                            {
                                
                                
                                
                                Text("\(stack.flashcardName)")
                                    .foregroundColor(Color("Azure"))
                                    .font(.system(size: 40.0, weight: .bold, design: .rounded))
                                    .padding()
                                
                                
                                
                                HStack {
                                    ForEach (stack.flashcardTags, id: \.self) { tag in
                                        Text("#\(tag)")
                                            .foregroundColor(Color("Oxford Blue"))
                                            .font(.system(size: 15, weight: .regular, design: .rounded))
                                            .padding(15)
                                            .background(Color("ButtonStack Color"))
                                            .cornerRadius(30)
                                        
                                        
                                    }
                                }
                                
                                
                                
                                
                                
                                
                            }
                        }
                        .padding()
                    }
                    .padding(.horizontal)
                    
                    
                    
                    
                    
                }
            }
        }
        .onAppear {
            flashcardManager.loadFlashcards()
            
        }
        
        .onChange(of: flashcardManager.flashcardStacks) { _ in
            flashcardManager.saveFlashcards()
        }
        
        .sheet(isPresented: $isFlashcardPresented) {
            CreateFlashcardSheet()
                .environmentObject(flashcardManager)
        }
        .fullScreenCover(isPresented: $showActiveRecallScreen, content: {
            ActiveRecallScreen()
        })
        
//        .fullScreenCover(isPresented: $viewFlashcardStackScreen, content: {
//            ViewFlashcardScreen()
//        })
//        
        
    } // Vstack
} // body View



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

