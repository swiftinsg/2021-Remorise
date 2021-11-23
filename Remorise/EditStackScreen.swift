//
//  EditStackScreen.swift
//  Remorise
//
//  Created by rgs on 20/11/21.
//

import SwiftUI

struct EditStackScreen: View {
    @ObservedObject var textFieldManager = TextFieldManager()
    @ObservedObject private var flashcardManager = FlashcardManager()
    @State private var currentFlashcard: Int = 0
    @State private var flashcardStack = FlashcardStack(flashcards: [Flashcard(question: "", answer: "")], flashcardName: "", flashcardTags: [])
    var flashcards: [Flashcard]
    
    
    var body: some View {
        
        
        NavigationView {
            
            ForEach(flashcardManager.flashcardStacks) { stack in
            VStack {
                
                
                TextField(stack.flashcardName, text: $flashcardStack.flashcardName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.system(size: 24.0, weight: .bold,design: .rounded))
                    .lineLimit(1)
                
                
                
                
                
                ScrollView(.horizontal) {
                    HStack {
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(30)
                        }
                        
                        Button("#geography") {
                            print("Pressed")
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        
                        
                        Button("#history") {
                            print("Pressed")
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        
                    }
                    .padding()
                }
                
                
                ScrollView {
                    ForEach(flashcardManager.flashcardStacks)  { stack in
                        ZStack {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)))
                                .frame(width: 350, height: 220)
                            
                            
                            Text(flashcards[currentFlashcard].question)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                            
                     
                        }
                    }
                }
                
            }
        }
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    
                    Button("Done") {
                        
                    }
                }
            }
        }
        
    }
}

struct EditStackScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditStackScreen(flashcards: [Flashcard(question: "", answer: "")])
    }
}

