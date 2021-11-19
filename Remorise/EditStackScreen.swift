//
//  EditStackScreen.swift
//  Remorise
//
//  Created by rgs on 20/11/21.
//

import SwiftUI

struct EditStackScreen: View {
    @ObservedObject var textFieldManager = TextFieldManager()
    
    var body: some View {
        
        
        NavigationView {
            
            VStack {
                
                
                TextField("Stack name", text: $textFieldManager.userInput)
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
                    VStack {
                        Button("What is the capital of Italy?") {
                            
                        }
                        .padding()
                        .font(.system(size: 35.0, weight: .bold,design: .rounded))
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .multilineTextAlignment(.center)
                        .cornerRadius(15)
                        .navigationTitle("Edit Stack")
                        .navigationBarTitleDisplayMode(.inline)
                        
                        Button("What is the capital of Italy?") {
                            
                        }
                        .padding()
                        .font(.system(size: 35.0, weight: .bold,design: .rounded))
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .multilineTextAlignment(.center)
                        .cornerRadius(15)
                        .navigationTitle("Edit Stack")
                        
                        Button("What is the capital of Italy?") {
                            
                        }
                        .padding()
                        .font(.system(size: 35.0, weight: .bold,design: .rounded))
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .multilineTextAlignment(.center)
                        .cornerRadius(15)
                        .navigationTitle("Edit Stack")
                        
                        Button("What is the capital of Italy?") {
                            
                        }
                        .padding()
                        .font(.system(size: 35.0, weight: .bold,design: .rounded))
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .multilineTextAlignment(.center)
                        .cornerRadius(15)
                        .navigationTitle("Edit Stack")
                        Button("What is the capital of Italy?") {
                            
                        }
                        .padding()
                        .font(.system(size: 35.0, weight: .bold,design: .rounded))
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .multilineTextAlignment(.center)
                        .cornerRadius(15)
                        .navigationTitle("Edit Stack")
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
        EditStackScreen()
    }
}
