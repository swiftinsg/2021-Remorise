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
    @State private var showingDiscardFlashcardStackAlert = false
    @State private var showHomeScreen = false
    @State private var showEditFlashcardScreen = false
    @State private var showTagSheet = false
    var flashcards: [Flashcard]
    var dismiss: (Bool) -> Void
    
    
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
                                showTagSheet = true
                            } label: {
                                Image(systemName: "plus")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(30)
                            }
                            
                            ForEach (flashcardStack.flashcardTags, id: \.self) { tag in
                                Button("#\(tag)") {
                                    print("Pressed")
                                }
                                .padding()
                                .background(Color("Beau Blue"))
                                .foregroundColor(Color("Oxford Blue"))
                                .cornerRadius(30)
                            }
                        
                            
                           
                            
                        }
                        .padding()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .center ) {
                        Button("Edit your flashcards!") {
                            showEditFlashcardScreen = true
                        }
                        .padding()
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                        .background(Color("Beau Blue"))
                        .foregroundColor(Color("Oxford Blue"))
                        .cornerRadius(30)
                    }
                    
                    Spacer()
                    
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                    
                    Button {
                        showingDiscardFlashcardStackAlert = true
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    
                    Button("Done") {
                        
                        dismiss(false)
                        showHomeScreen = true
                        
                        
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showHomeScreen, content: {
            ContentView()
        })
        
        .fullScreenCover(isPresented: $showEditFlashcardScreen, content: {
            EditFlashcardScreen(flashcards: .constant([Flashcard(question: "", answer: "")]),color: .constant(.lightBlue),dismiss: { _ in })
        })
        
        .sheet(isPresented: $showTagSheet, content: {
            CreateTagSheet(dismiss: { newTag in
                showTagSheet = false
                
            })})
        
        .alert(isPresented: $showingDiscardFlashcardStackAlert) {
            Alert(
                title: Text("Deletion of Stack"),
                message: Text("Are you sure you want to delete the ENTIRE stack?"),
                primaryButton: .default(Text("Cancel"), action: {
                    
                }),
                secondaryButton: .destructive(Text("OK"), action: {
                    dismiss(false)
                    showHomeScreen = true
                })
                
            )
        } //end of alert
        
    }
    
}

struct EditStackScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditStackScreen(flashcards: ([Flashcard(question: "", answer: "")]), dismiss: {_ in })
    }
}


