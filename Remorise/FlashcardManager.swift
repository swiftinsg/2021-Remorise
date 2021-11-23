//
//  FlashcardManager.swift
//  Remorise
//
//  Created by rgs on 18/11/21.
//

import Foundation
import SwiftUI

struct Flashcard: Codable, Identifiable, Equatable {
    var question: String 
    var answer: String
    var id = UUID()
   
}

struct FlashcardStack: Codable, Identifiable, Equatable {
    
    var flashcards: [Flashcard]
    var flashcardName: String
    var flashcardTags: [String]
    var id = UUID()
    var myColor = MyColor.lightBlue

}




class FlashcardManager: ObservableObject {
    
    @Published var flashcardStacks: [FlashcardStack] = [FlashcardStack(flashcards: [], flashcardName: "Hi", flashcardTags: ["history", "geography"]), FlashcardStack(flashcards: [], flashcardName: "Hi", flashcardTags: ["history", "geography"])]
    
    func getArchiveURL() -> URL {
        let plistName = "flashcardData.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
        
    }
    
    func saveFlashcards() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFlashcards = try? propertyListEncoder.encode(flashcardStacks)
        try? encodedFlashcards?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func loadFlashcards() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        
        
        if let retrievedFlashcardsData = try? Data(contentsOf: archiveURL),
           let decodedFlashcards = try? propertyListDecoder.decode(Array<FlashcardStack>.self, from: retrievedFlashcardsData) {
            flashcardStacks = decodedFlashcards
        }
    }
}
