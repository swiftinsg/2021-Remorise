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

class FlashcardManager: ObservableObject {
    
    @Published var flashcards: [Flashcard] = [Flashcard(question: "", answer: "")]
    
    func getArchiveURL() -> URL {
        let plistName = "flashcardData.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
        
    }
    
    func saveFlashcards() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFlashcards = try? propertyListEncoder.encode(flashcards)
        try? encodedFlashcards?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func loadFlashcards() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        
        
        if let retrievedFlashcardsData = try? Data(contentsOf: archiveURL),
           let decodedFlashcards = try? propertyListDecoder.decode(Array<Flashcard>.self, from: retrievedFlashcardsData) {
            flashcards = decodedFlashcards
        }
    }
}
