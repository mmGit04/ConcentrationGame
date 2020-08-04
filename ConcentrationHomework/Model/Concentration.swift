//
//  Game.swift
//  ConcentrationHomework
//
//  Created by Mina Milosavljevic on 2/12/20.
//  Copyright © 2020 Mina Milosavljevic. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var oneAndOnlyCard: Int?
    var flipCount: Int = 0
    var score:Int = 0
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
        
    }
    
    func touchCard (cardIndex: Int) {
        if cards.indices.contains(cardIndex) {
            if cardIndex != oneAndOnlyCard {
                flipCount += 1
            }
            if let index = oneAndOnlyCard, oneAndOnlyCard != cardIndex {
                if cards[index].identifier == cards[cardIndex].identifier {
                    cards[index].isMatched = true
                    cards[cardIndex].isMatched = true
                    score += 2
                }
                else {
                    if cards[cardIndex].isOpened {
                        score -= 1
                    }
                    else {
                        cards[cardIndex].isOpened = true
                    }
                    
                }
                cards[cardIndex].isFaceUp = true
                oneAndOnlyCard = nil
            }
            else {
                cards[cardIndex].isOpened = true
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                cards[cardIndex].isFaceUp = true
                oneAndOnlyCard = cardIndex
            }
        }
    }
    
    
}
