//
//  CreateFlashcardScreen.swift
//  RemBasicCode
//
//  Created by Trinity Lee on 19/11/21.
//

import SwiftUI
import Foundation


struct ViewFlashcardScreen: View {
    @State private var currentFlashcard: Int = 0
    @Binding var flashcards: [Flashcard]
    @State private var showingDiscardFlashcardStackAlert = false
    @State private var showingDiscardFlashcardAlert = false
   
    @State var flipped = false
    var dismiss: () -> Void
    
    var body: some View {
        NavigationView {
            
            
            VStack {
                Text("\(currentFlashcard+1)/\(flashcards.count)")
                    .padding(.bottom, 20)
                    .navigationTitle("View Flashcards")
                    .navigationBarTitleDisplayMode(.inline)
                HStack(alignment: .center, spacing: 10) {
                    
                    Button {
                        
                        if currentFlashcard != 0 {
                            
                            currentFlashcard -= 1
                            flipped = false
                        }
                    } label: {
                        Image(systemName:"arrow.left")
                            .padding(.leading)
                            .foregroundColor(.black)
                            .opacity(currentFlashcard != 0 ? 1 : 0)
                    }
                    FlipFlashcard(flipped: $flipped, front: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)))
                                    .frame(height: 220)
//
//                                Text(FlashcardStack(Flashcard[currentFlashcard].question))
//                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                            }
                        }, back: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)))
                                    .frame(height: 220)
                                
//                                Text(FlashcardStack(Flashcard[currentFlashcard].answer))
//                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                            }
                        })
                    
                    
                    
                    
                   
                        Button {
                            currentFlashcard += 1
                            flipped = false
                            
                        } label: {
                            Image(systemName:"arrow.right")
                                .padding(.trailing)
                                .foregroundColor(.black)
                        }
                    
                } //end of HStack
                .padding(.bottom, 10)
                
                HStack(spacing: 10) {
                    Button {
                        withAnimation {
                            flipped.toggle()
                        }
                    } label: {
                        ZStack{
                            Capsule()
                                .fill(Color(UIColor(red: 136/255, green: 131/255, blue: 131/255, alpha: 0.17)))
                                .frame(width: 100, height: 50)
                                
                            HStack{
                                
                                Text("Flip")
                                Image(systemName:"rectangle.on.rectangle.angled")
                            }
                            .padding()
                        }
                        .padding()
                      
                    }
                   
                        
                    
                    
                }
                    
                    
                }
                .padding(.bottom, 1)
                
            }
            .toolbar {
                
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    
                    Button("Done") {
                        dismiss()
                    }
                }
                
                
                
                
            }
        }
        
            
        
    
    
    
    
}



struct ViewFlashcardScreen_Previews: PreviewProvider {
    static var previews: some View {
        ViewFlashcardScreen(flashcards: .constant([Flashcard(question: "", answer: "")]), dismiss: {})
    }
}



