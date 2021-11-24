import SwiftUI
import Foundation

struct CreateFlashcardSheet: View {
    @State private var flashcardStacks = FlashcardStack(flashcards: [Flashcard(question: "", answer: "")], flashcardName: "", flashcardTags: [])
    @State private var showTagSheet = true
    @State private var showFlashcardSheet = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var flashcardManager: FlashcardManager
    
    
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
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing)
                    {
                       
                        Button("Next")  {
                            
                            showFlashcardSheet = true
                            
                        }
                    }
                }
                
                ZStack
                {
                    Rectangle()
                        .foregroundColor(Color.init("Cyan Blue"))
                        .frame(height: 90)
                    
                    CustomsTextEditor.init(placeholder:"Name of Stack", text: $flashcardStacks.flashcardName)
                        .multilineTextAlignment(TextAlignment.center)
                        .font(.system(size: 25, weight: .bold))
                        
                }
                .frame(height: 240)
            
                
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                            Button {
                                showTagSheet = true
                                
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
                            
                            ForEach (flashcardStacks.flashcardTags, id: \.self) { tag in
                                Text("#\(tag)")
                                    .foregroundColor(Color("Oxford Blue"))
                                    .font(.system(size: 15))
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(30)
                                
                                
                            }
                        
                    } //end of HStack
                 //   .padding()
                }
                .padding()
                
                Spacer()
            }
            
        }
        .sheet(isPresented: $showTagSheet, content: {
            CreateTagSheet(dismiss: { newTag in
                if let newUnWrappedTag = newTag { flashcardStacks.flashcardTags.append(newUnWrappedTag)}
                
                showTagSheet = false
                
            })
        })
        .fullScreenCover(isPresented: $showFlashcardSheet, content: {
            CreateFlashcardScreen(flashcards: $flashcardStacks.flashcards, color:
                                    $flashcardStacks.myColor) { shouldSave in
                showFlashcardSheet = false
                if shouldSave {
                    flashcardManager.flashcardStacks.append(flashcardStacks)
                }
                presentationMode.wrappedValue.dismiss()
            }
            
        })
        
    }
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
        CreateFlashcardSheet().environmentObject(FlashcardManager())
    }
}
