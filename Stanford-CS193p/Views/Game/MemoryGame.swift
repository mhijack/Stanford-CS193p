//
//  GameViewModel.swift
//  Stanford-CS193p
//
//  Created by Jack Chen on 2021-06-24.
//

import Foundation

struct MemoryGame<CardContent: Equatable> {
    
    struct Card: Identifiable {
        var id: UUID
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
    private(set) var cards: Array<Card>
    
    private var indexOfOnlyCardFacingUp: Int?
    
    mutating func choose(_ card: Card) {
        /// If a card is already facing up, match;
        /// Otherwise, just flip the card
        /// If tapped card already facing up, or already matched, do nothing.
        if let index = cards.firstIndex(where: { $0.id == card.id }),
           !cards[index].isFaceUp,
           !cards[index].isMatched {
            if let indexOfOnlyCardFacingUp = indexOfOnlyCardFacingUp {
                if cards[indexOfOnlyCardFacingUp].content == card.content {
                    cards[indexOfOnlyCardFacingUp].isMatched = true
                    cards[index].isMatched = true
                }
                self.indexOfOnlyCardFacingUp = nil
            } else {
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                indexOfOnlyCardFacingUp = index
            }
            cards[index].isFaceUp.toggle()
        }
    }
    
    private func index(of card: Card) -> Int? {
        for (index, c) in cards.enumerated() {
            if card.id == c.id {
                return index
            }
        }
        return nil
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: ((Int) -> CardContent)) {
        cards = []
        for index in 0..<numberOfPairsOfCards {
            let content = createCardContent(index)
            cards.append(Card(id: UUID(), isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(id: UUID(), isFaceUp: false, isMatched: false, content: content))
        }
    }
    
}
