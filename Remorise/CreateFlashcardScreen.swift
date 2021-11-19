//
//  CreateFlashcardScreen.swift
//  Remorise
//
//  Created by Trinity Lee on 17/11/21.
// Create New Flashcard Screen
import SwiftUI
import Foundation


struct CreateFlashcardScreen: View {
    @State private var setColor = Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1))
    @State private var currentFlashcard: Int = 0
    @Binding var flashcards: [Flashcard]
    @State private var showingDiscardFlashcardStackAlert = false
    @State private var showingDiscardFlashcardAlert = false
    var dismiss: () -> Void
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                Text("\(currentFlashcard+1)/\(flashcards.count)")
                    .padding(.bottom, 20)
                    .navigationTitle("Create Flashcards")
                    .navigationBarTitleDisplayMode(.inline)
                HStack(alignment: .center, spacing: 10) {
                    
                    Button {
                        
                        if currentFlashcard != 0 {
                            
                            currentFlashcard -= 1
                        }
                    } label: {
                        Image(systemName:"arrow.left")
                            .padding(.leading)
                         //   .foregroundColor(.black.opacity(currentFlashcard != 0 ? 1 : 0))
                    }
                    
                    
                    ZStack(alignment: .topLeading) {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(setColor)
                            .frame(height:220)
                        CustomTextEditor(placeholder: "Type question here...", text: $flashcards[currentFlashcard].question)
                            .font(.system(.body, design: .rounded))
                            .multilineTextAlignment(TextAlignment.center)
                            .frame(height: 220)
                    }
                    
                    
                    
                    if currentFlashcard != flashcards.count - 1 {
                        Button {
                            currentFlashcard += 1
                            
                        } label: {
                            Image(systemName:"arrow.right")
                                .padding(.trailing)
                                .foregroundColor(.black)
                        }
                    } else {
                        Button {
                            flashcards.append(Flashcard(question: "", answer: ""))
                            currentFlashcard += 1
                            
                        } label: {
                            Image(systemName:"plus")
                                .padding(.trailing)
                                .foregroundColor(.black)
                        }
                    }
                } //end of HStack
                .padding(.bottom, 10)
                
                HStack(spacing: 10) {
                    Button {
                        
                    } label: {
                        ZStack{
                            Capsule()
                                .fill(Color(UIColor(red: 136/255, green: 131/255, blue: 131/255, alpha: 0.17)))
                                .frame(width: 100, height: 30)
                            HStack{
                                Text("Flip")
                                Image(systemName:"rectangle.on.rectangle.angled")
                            }
                        }
                        
                    }
                    Button {
                        showingDiscardFlashcardAlert.toggle()
                    } label: {
                        Image(systemName:"minus.circle.fill")
                            .padding(.trailing)
                            .foregroundColor(.red)
                    }
                    .alert(isPresented: $showingDiscardFlashcardAlert) {
                                Alert(
                                    title: Text("Deletion of Flashcard"),
                                    message: Text("Are you sure you want to delete the current flashcard?"),
                                    primaryButton: .destructive(Text("Cancel"), action: {
                                        
                                    }),
                                    secondaryButton: .default(Text("OK"), action: {
                                        
                                    })
                                )
                        
                    
                    
                }
                    
                    
                }
                .padding(.bottom, 1)
                HStack(spacing: 30) {
                    Button(action: {
                        setColor = Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1))
                            }){
                                ZStack{
                                    Circle()
                                        .fill(Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)))
                                        .frame(width: 20, height: 20)
                                }
                            }
                    Button(action: {
                        setColor = Color(UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 1))
                            }){
                                ZStack{
                                    Circle()
                                        .fill(Color(UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 1)))
                                        .frame(width: 20, height: 20)
                                }
                            }
                    Button(action: {
                        setColor = Color(UIColor(red: 0/255, green: 127/255, blue: 255/255, alpha: 1))
                            }){
                                ZStack{
                                    Circle()
                                        .fill(Color(UIColor(red: 0/255, green: 127/255, blue: 255/255, alpha: 1)))
                                        .frame(width: 20, height: 20)
                                }
                            }


                }
            }
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                    
                    Button {
                        showingDiscardFlashcardStackAlert.toggle()
                        
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                    .alert(isPresented: $showingDiscardFlashcardStackAlert) {
                        Alert(
                            title: Text("Deletion of Stack"),
                            message: Text("Are you sure you want to delete the ENTIRE stack?"),
                            primaryButton: .destructive(Text("Cancel"), action: {
                                
                            }),
                            secondaryButton: .default(Text("OK"), action: {
                                
                            })
                        )
                    }
                    
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    
                    Button("Done") {
                        dismiss()
                    }
                }
                
                
                
                
            }
        }
        
            
        
    
    
    
    
}

//placeholder text code:
struct CustomTextEditor: View {
    
    let placeholder: String
    @Binding var text: String
    let internalPadding: CGFloat = 5
    
    var body: some View {
        
        ZStack(alignment: .center) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color.primary.opacity(0.25))
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .accentColor(.green)
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 3, trailing: 0))
                    .padding(internalPadding)
                
                
            }
            ScrollView{
                TextEditor(text: $text)
                    .frame(minHeight: 30)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(internalPadding)
                                
            }
            
                        
            
        }.onAppear() {
            UITextView.appearance().backgroundColor = UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 0)
            
        }.onDisappear() {
            UITextView.appearance().backgroundColor = UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)
            
        }
    }
} //end of placeholder text code


struct CreateFlashcardScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateFlashcardScreen(flashcards: .constant([]), dismiss: {})
    }
}
}


