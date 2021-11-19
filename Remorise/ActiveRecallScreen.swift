//
//  ContentView.swift
//  RemBasicCode
//
//  Created by Trinity Lee on 15/11/21.
//

import SwiftUI

class TextFieldManager2 : ObservableObject {
    let characterLimit = 300
    @Published var userInput = "" {
        didSet{
            if userInput.count > characterLimit {
                userInput = String(userInput.prefix(characterLimit))
            }
        }
    }
}



struct ActiveRecallScreen: View {
    @ObservedObject var textFieldManager2 = TextFieldManager2()
    @State private var text = ""
    @Environment(\.presentationMode) var presentationMode

    

    
    var body: some View {
        NavigationView {
            
            
                VStack {
                    Button {
                        
                    } label: {
                        Image(systemName:"shuffle")
                            .foregroundColor(.black)
                        Text("Shuffle")
                            .foregroundColor(.black)

                    }
                    .padding(.all,8)
                    .background(Color(UIColor(red: 136/255, green: 131/255, blue: 131/255, alpha: 0.17)))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.top, 50)
                    .offset(y:-10)

                    
                        .navigationTitle("Active recall")
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
                                                    .overlay( Text("Question/answer goes here"))
                                                    .multilineTextAlignment(TextAlignment.center)
                                                    
                                                
                                            }
                            
                            
                        
                        Button {
                            
                        } label: {
                            Image(systemName:"arrow.right")
                                .padding(.trailing)
                                .foregroundColor(.black)
                        }
                    } //end of HStack
                    .padding(.bottom, 30)
                    ZStack{
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color(UIColor(red: 153/255, green: 204/255, blue: 255/255, alpha: 1)))
                                .frame(height: 130)
                                .padding(.leading, 50)
                                .padding(.trailing, 50)
                        HStack {
                            CustomTextEditor.init(placeholder: "Type your answer here...", text: $textFieldManager2.userInput)
                                    .frame(height: 100)
                                    .multilineTextAlignment(TextAlignment.center)

                                           }
                                                   
                                        }

                    
                }
                .toolbar {
                    ToolbarItem(placement: ToolbarItemPlacement.navigation) {
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()

                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.red)
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
                        .font(.system(size: 15))
                        .accentColor(.green)
                        .padding(EdgeInsets(top: 0, leading: 4, bottom:0, trailing: 0))
                        .padding(internalPadding)
                    
                
                }
                ScrollView {
                    TextEditor(text: $text)
                        .frame(minHeight: 30)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(internalPadding)
                        .frame(width: 240, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                }
               
                
                
            }.onAppear() {
                UITextView.appearance().backgroundColor = UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 0)
                
            }.onDisappear() {
                UITextView.appearance().backgroundColor = UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)
                
            }
        }
            }

        



struct ActiveRecallScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}




