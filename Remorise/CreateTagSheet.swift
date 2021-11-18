//
//  CreateTagSheet.swift
//  Remorise
//
//  Created by rgs on 18/11/21.
//

import SwiftUI

class TextFieldManager: ObservableObject {
    
    let characterLimit = 9
    
    @Published var userInput = "" {
        
        didSet {
            
            if userInput.count > characterLimit {
                userInput = String(userInput.prefix(characterLimit))
            }
        }
    }
    
}

struct CreateTagSheet: View {
    
   
    @ObservedObject var textFieldManager = TextFieldManager()
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                
                
                
                TextField("Tag name", text: $textFieldManager.userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .navigationTitle("Create New Tag")
                    .navigationBarTitleDisplayMode(.inline)
                    .font(.system(size: 35.0, weight: .bold,design: .rounded))
                
                
                
                
                Spacer()
                
                
                
                
            }
            
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                    
                    Button("Cancel") {
                        
                    }
                    .foregroundColor(.red)
                    
                    
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    
                    Button("Done") {
                        
                    }
                }
            }
        }
        
    }
}

struct CreateTagSheet_Previews: PreviewProvider {
    static var previews: some View {
        CreateTagSheet()
    }
}