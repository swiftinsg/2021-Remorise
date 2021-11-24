//
//  ContentView.swift
//  Remorise
//
//  Created by Trinity Lee on 14/11/21.
// Home Screen

import SwiftUI


struct ContentView: View {
    @State private var flashcardStack = FlashcardStack(flashcards: [Flashcard(question: "", answer: "")], flashcardName: "", flashcardTags: [""])
    @State private var showActiveRecallScreen = false
    @ObservedObject private var flashcardManager = FlashcardManager()
    @State private var isFlashcardPresented = false
    @State private var currentlyEditedStack: FlashcardStack? = nil
   
//    @State private var currentFlashcard: Int = 0
    @State private var currentlySelectedStack: FlashcardStack? = nil
    
    
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
            
            ScrollView(.horizontal)
            {
                HStack(spacing: 10)
                {
                    Button
                    {
                        userSelectedTag = nil
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
                    
                    
                    ForEach (allTags, id: \.self) { tag in
                        Button {
                            userSelectedTag = tag
                        } label: {
                                Text("#\(tag)")
                                    .foregroundColor(Color("Oxford Blue"))
                                    .font(.system(size: 20, weight: .regular, design: .rounded))
                                    .padding(15)
                                    .background(Color("ButtonStack Color"))
                                    .cornerRadius(30)
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            
            if flashcardManager.flashcardStacks.count != 0 {
                ScrollView {
                    ForEach(filteredStacks) { stack in
                        
                        
                        
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
                                            currentlySelectedStack = stack
                                        }) {
                                            Label("Review", systemImage: "book.fill")
                                        }
                                        Button(action: {
                                            currentlyEditedStack = stack
                                        }) {
                                            Label("Edit", systemImage: "pencil")
                                        }
                                    } label: {
                                        ZStack{
                                            Circle()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(Color("Azure"))
                                            Image(systemName: "list.bullet")
                                                .foregroundColor(Color("Beau Blue"))
                                            
                                        }
                                    }
                                    .padding()
                                }
                                
                                VStack(alignment:.leading)
                                {
                                    
                                    
                                    
                                    Text("\(stack.flashcardName)")
                                        .foregroundColor(Color("Azure"))
                                        .font(.system(size: 40.0, weight: .bold, design: .rounded))
                                        .padding()
                                    
                                    
                                    
                                    ScrollView(.horizontal) {
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
                            }
                            .padding()
                        }
                        .padding(.horizontal)
                        
                        
                        
                        
                        
                    }
                }
            } else {
                VStack {
                Text("No flashcard stack created yet")
                Text("Click the '+' button to get started")
                }
                .padding(.top, 150)
            }
            Spacer()
        }
        .onAppear {
            flashcardManager.loadFlashcards()
            
        }
        
        .onChange(of: flashcardManager.flashcardStacks) { _ in
            flashcardManager.saveFlashcards()
        }
        
        .fullScreenCover(isPresented: $isFlashcardPresented) {
            CreateFlashcardSheet()
                .environmentObject(flashcardManager)
        }
        .fullScreenCover(isPresented: $showActiveRecallScreen, content: {
            ActiveRecallScreen()
        })
        
        .fullScreenCover(item: $currentlySelectedStack ) { i in
            ViewFlashcardScreen(flashcards: i.flashcards)
        }
        
    } // Vstack
} // body View
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
