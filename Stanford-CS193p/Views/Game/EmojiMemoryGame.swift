//
//  EmojiMemoryGame.swift
//  Stanford-CS193p
//
//  Created by Jack Chen on 2021-06-24.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    typealias Game = MemoryGame<String>
    
    static let emojis = foodsEmojis
    
    static func createMemoryGame() -> Game {
        return Game(numberOfPairsOfCards: 6) { index in
            return EmojiMemoryGame.emojis[index]
        }
    }
    
    @Published private var model: Game = EmojiMemoryGame.createMemoryGame()
    
    public var cards: [Card] {
        return model.cards
    }
    
    // MARK: - Actions
    
    public func choose(_ card: Card) {
        model.choose(card)
    }
    
}
