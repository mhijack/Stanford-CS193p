//
//  EmojiMemoryGame.swift
//  Stanford-CS193p
//
//  Created by Jack Chen on 2021-06-24.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = foodsEmojis
    
    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 4) { index in
            return EmojiMemoryGame.emojis[index]
        }
    }
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    public var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
}
