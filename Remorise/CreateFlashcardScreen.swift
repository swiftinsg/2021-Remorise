//
//  CreateFlashcardScreen.swift
//  RemBasicCode
//
//  Created by Trinity Lee on 19/11/21.
//

import SwiftUI
import Foundation

enum MyColor: Int, Codable {
   case lightBlue
   case blue2
   case darkBlue
}

func getColor(color: MyColor) -> Color {
    switch color {
    case .lightBlue:
        return Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1))
    case .blue2:
        return Color(UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 1))
    case .darkBlue:
        return Color(UIColor(red: 0/255, green: 127/255, blue: 255/255, alpha: 1))

    }
}





struct CreateFlashcardScreen: View {
    @State private var currentFlashcard: Int = 0
    @Binding var flashcards: [Flashcard]
    @State private var showingDiscardFlashcardStackAlert = false
    @State private var showingDiscardFlashcardAlert = false
    @State var flipped = false
    @State private var showHomeScreen = false
    @Binding var color: MyColor

    var dismiss: (Bool) -> Void
    
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
                                .fill(getColor(color: color))
                                .frame(height: 220)

                            CustomTextEditor(placeholder: "Type question here...", bold: true, text: $flashcards[currentFlashcard].question)
                        }
                    }, back: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(getColor(color: color))
                                .frame(height: 220)
                            CustomTextEditor(placeholder: "Type answer here...", bold: false, text: $flashcards[currentFlashcard].answer)
                        }
                    })
                    
                    //                    ZStack(alignment: .topLeading) {
                    //                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                    //                            .fill(Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)))
                    //                            .frame(height: 220)
                    //                        CustomTextEditor(placeholder: "Type question here...", text: $flashcards[currentFlashcard].question)
                    //                            .font(.system(.body, design: .rounded))
                    //                            .multilineTextAlignment(TextAlignment.center)
                    //                            .frame(height: 220)
                    //                    }
                    
                    
                    
                    if currentFlashcard != flashcards.count - 1 {
                        Button {
                            currentFlashcard += 1
                            flipped = false
                            
                        } label: {
                            Image(systemName:"arrow.right")
                                .padding(.trailing)
                                .foregroundColor(.black)
                        }
                    } else {
                        Button {
                            flashcards.append(Flashcard(question: "", answer: ""))
                            currentFlashcard += 1
                            flipped = false
                            
                            
                            
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
                        withAnimation {
                            flipped.toggle()
                        }
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
                            primaryButton: .default(Text("Cancel"), action: {
                                
                            }),
                            secondaryButton: .destructive(Text("OK"), action: {
                                if currentFlashcard != 0
                                {
                                    flashcards.remove(at: currentFlashcard - 1)
                                    currentFlashcard = currentFlashcard - 1
                                }
                                else {
                                    showingDiscardFlashcardStackAlert = true
                                }
                            })
                        )
                        
                        
                        
                    }
                    
                    
                }
                .padding(.bottom, 1)
                HStack(spacing: 30) {
                    Button(action: {
                        color = .lightBlue

                        
                    }){
                        ZStack{
                            Circle()
                                .fill(Color(UIColor(red: 204/255, green: 229/255, blue: 255/255, alpha: 1)))
                                .frame(width: 20, height: 20)
                        }
                    }
                    Button(action: {
                        color = .blue2

                        
                    }){
                        ZStack{
                            Circle()
                                .fill(Color(UIColor(red: 102/255, green: 178/255, blue: 255/255, alpha: 1)))
                                .frame(width: 20, height: 20)
                        }
                    }
                    Button(action: {
                        color = .darkBlue

                        
                    }){
                        ZStack{
                            Circle()
                                .fill(Color(UIColor(red: 0/255, green: 127/255, blue: 255/255, alpha: 1)))
                                .frame(width: 20, height: 20)
                        }
                    }
                    
                }
            } //end of VStack
            .fullScreenCover(isPresented: $showHomeScreen, content: {
                ContentView()
            })
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
                            primaryButton: .default(Text("Cancel"), action: {
                                
                            }),
                            secondaryButton: .destructive(Text("OK"), action: {
                                dismiss(false)
                            })
                        )
                    } //end of alert
                    
                }
                
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    
                    Button("Done") {
                        dismiss(true)
                    }
                }
                
            } //end of toolbar
        }
    }
    
    //placeholder text code:
    struct CustomTextEditor: View {
        
        let placeholder: String
        let bold: Bool
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
                    .font(.system(size: 25, weight: bold ? Font.Weight.bold : Font.Weight.regular, design: .rounded))
                    .frame(minHeight: 30)
                    .multilineTextAlignment(.center)
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
            CreateFlashcardScreen(flashcards: .constant([Flashcard(question: "", answer: "")]),color: .constant(.lightBlue),dismiss: {_ in })        }
    }
}

struct FlipFlashcard<Front, Back>: View where Front: View, Back: View {
    var front: () -> Front
    var back: () -> Back
    
    @Binding var flipped: Bool
    
    init(flipped: Binding<Bool>, @ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back) {
        self.front = front
        self.back = back
        self._flipped = flipped
    }
    
    var body: some View {
        ZStack {
            if flipped {
                back()
                    .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 1, y: 0, z: 0))
            } else {
                front()
            }
        }
        .rotation3DEffect(.degrees(flipped ? 180 : 0), axis: (x: 1, y: 0, z: 0))
        .padding()
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        
        //            //tap gesture recogniser to flip flashcard
        //            .onTapGesture {
        //                flipFlashcard()
        //            }
        //            .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0))
    }
} // end of FlipFlashcard struct
