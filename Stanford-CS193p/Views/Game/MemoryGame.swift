//
//  GameViewModel.swift
//  Stanford-CS193p
//
//  Created by Jack Chen on 2021-06-24.
//

import Foundation

struct MemoryGame<CardContent> {
    
    private(set) var cards: Array<Card>
    
    struct Card: Identifiable {
        var id: UUID
        
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
    func choose(_ card: Card) {
        assertionFailure()
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: ((Int) -> CardContent)) {
        cards = Array<Card>()
        for index in 0..<numberOfPairsOfCards {
            let content = createCardContent(index)
            cards.append(Card(id: UUID(), isFaceUp: true, isMatched: false, content: content))
            cards.append(Card(id: UUID(), isFaceUp: true, isMatched: false, content: content))
        }
    }
    
}
