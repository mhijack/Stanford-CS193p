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
                guard index != indexOfOnlyCardFacingUp else {
                    return
                }
                
                if cards[indexOfOnlyCardFacingUp].content == card.content {
                    cards[index].isFaceUp = true
                    cards[indexOfOnlyCardFacingUp].isMatched = true
                    cards[index].isMatched = true
                } else {
                    /// Only face up temporarily. Eventually face both down.
                    cards[index].isFaceUp.toggle()
                    for i in cards.indices {
                        if !cards[i].isMatched {
                            cards[i].isFaceUp = false
                        }
                    }
                }
                self.indexOfOnlyCardFacingUp = nil
            } else {
                indexOfOnlyCardFacingUp = index
                cards[index].isFaceUp.toggle()
            }
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
        cards = Array<Card>()
        for index in 0..<numberOfPairsOfCards {
            let content = createCardContent(index)
            cards.append(Card(id: UUID(), isFaceUp: false, isMatched: false, content: content))
            cards.append(Card(id: UUID(), isFaceUp: false, isMatched: false, content: content))
        }
    }
    
}
