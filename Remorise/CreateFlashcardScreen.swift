//
//  CreateFlashcardScreen.swift
//  Remorise
//
//  Created by Trinity Lee on 17/11/21.
// Create New Flashcard Screen
import SwiftUI
import Foundation
struct CreateFlashcardScreen: View {
    @State private var text = ""
    
    var body: some View {
        NavigationView {
            
            
                VStack {
                    Text("1/1")
                        .padding(.bottom, 20)
                        .navigationTitle("Create Flashcards")
                        .navigationBarTitleDisplayMode(.inline)
                    HStack(alignment: .center, spacing: 10) {
                        Button {
                            
                        } label: {
                            Image(systemName:"arrow.left")
                                .padding(.leading)
                                .foregroundColor(.black)
                        }
                        
                        ZStack(alignment: .topLeading) {
                                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                                    .fill(Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)))
                                                    .frame(height: 220)
                                                CustomTextEditor.init(placeholder: "Type question here...", text: $text)
                                                    .multilineTextAlignment(TextAlignment.center)
                                                    .frame(height: 220)
                                            }
                            
                            
                        
                        Button {
                            
                        } label: {
                            Image(systemName:"arrow.right")
                                .padding(.trailing)
                                .foregroundColor(.black)
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
                            
                        } label: {
                            Image(systemName:"minus.circle.fill")
                                .padding(.trailing)
                                .foregroundColor(.red)
                        }
                        
                        
                    }
                    .padding(.bottom, 1)
                    HStack(spacing: 30) {
                        Circle()
                            .fill(Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)))
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color(UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 1)))
                            .frame(width: 20, height: 20)
                        Circle()
                            .fill(Color(UIColor(red: 0/255, green: 127/255, blue: 255/255, alpha: 1)))
                            .frame(width: 20, height: 20)
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
            TextEditor(text: $text)
                .frame(minHeight: 30)
                .fixedSize(horizontal: false, vertical: true)
                .padding(internalPadding)
            
            
        }.onAppear() {
            UITextView.appearance().backgroundColor = UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 0)
            
        }.onDisappear() {
            UITextView.appearance().backgroundColor = UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)
            
        }
    }
} //end of placeholder text code


struct CreateFlashcardScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateFlashcardScreen()
    }
}
