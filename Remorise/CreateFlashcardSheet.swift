//
//  CreateFlashcardSheet.swift
//  Remorise
//
//  Created by Wenyue on 15/11/21.
//
import SwiftUI
import Foundation

struct CreateFlashcardSheet: View
{
    
    @State private var text = ""
    @State private var showSheet = false
    
    var body: some View
    {
        NavigationView
        {
    
            VStack(alignment: .leading)
            {
                
                VStack(alignment: .leading)
                {
                    Text("Create")
                        .foregroundColor(Color("Cyan Blue"))
                        .font(.system(size: 40.0, weight: .bold, design: .rounded))
                    
                    Text("Your")
                        .foregroundColor(Color("Maya Blue"))
                        .font(.system(size: 40.0, weight: .bold,design: .rounded))
                    
                    Text("New")
                        .foregroundColor(Color("Dodger Blue"))
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                    
                    Text("Flashcard")
                        .foregroundColor(Color("Dodger Blue"))
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                }
                .padding()
                .frame(height: 150)
                .toolbar
                {
                    ToolbarItem(placement: .navigationBarLeading)
                    {
                        Button("Cancel")
                        {
                            
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing)
                    {
                        NavigationLink(
                            destination: CreateFlashcardScreen().navigationBarHidden(true),
                            label: {
                                Text("Next")
                            })
                    }
                }
                
                ZStack
                {
                    Rectangle()
                        .foregroundColor(Color.init("Cyan Blue"))
                        .frame(height: 90)
                    
                    CustomsTextEditor.init(placeholder:"Name of Stack", text: $text)
                        .multilineTextAlignment(TextAlignment.center)
                }
                .frame(height: 240)
                HStack(spacing: 10)
                {
                    Button {
                        showSheet = true
                        
                    } label:
                    {
                        Image(systemName: "plus")
                            .foregroundColor(Color("Oxford Blue"))
                            .font(.system(size: 30))
                    }
                    .padding()
                    .frame(width: 40, height: 40)
                    .background(Color("Beau Blue"))
                    .clipShape(Circle())
                    
                    Button
                    {
                        
                    } label:
                    {
                        Text("#history")
                            .foregroundColor(Color("Oxford Blue"))
                            .font(.system(size: 15))
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
                            .font(.system(size: 15))
                    }
                    .padding()
                    .frame(alignment: .leading)
                    .background(Color("Beau Blue"))
                    .cornerRadius(30)
                }
                .padding()
                .frame(height: 10)
                
                Spacer()
            }
            
        }
        .sheet(isPresented: $showSheet, content: {
            CreateTagSheet()
        })
    }
    
    
    struct CustomsTextEditor: View {
        
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
    }
    
    struct CreateFlashcardSheet_Previews: PreviewProvider
    {
        static var previews: some View
        {
            CreateFlashcardSheet()
        }
    }
}
