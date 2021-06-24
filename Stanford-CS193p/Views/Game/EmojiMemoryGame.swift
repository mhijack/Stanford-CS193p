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
        return MemoryGame<String>(numberOfPairsOfCards: 8) { index in
            return EmojiMemoryGame.emojis[index]
        }
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    public var cards: [MemoryGame<String>.Card] {
        return model.cards
    }
    
    // MARK: - Actions
    
    public func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
