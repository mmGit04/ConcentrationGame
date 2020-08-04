//
//  ViewController.swift
//  ConcentrationHomework
//
//  Created by Mina Milosavljevic on 2/12/20.
//  Copyright © 2020 Mina Milosavljevic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var score: UILabel!
    
    lazy var game:Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    var emojiChoices = Theme.getTheme()
    
    var emojiCard = [Int: String] ()
    
    
    @IBAction func newGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
        game.flipCount = 0
        emojiChoices = Theme.getTheme()
        for button in cardButtons {
            button.isEnabled = true
        }
        updateView()
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBOutlet var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let index = cardButtons.firstIndex(of: sender) {
            game.touchCard(cardIndex: index)
            updateView()
        }
    }
    
    func updateView() {
        flipCountLabel.text = "Flip count: \(game.flipCount)"
        score.text = "Score: \(game.score)"
        for i in cardButtons.indices {
            let card = game.cards[i]
            let button = cardButtons[i]
            if card.isFaceUp {
                button.setTitle(emoji(card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = game.cards[i].isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                if game.cards[i].isMatched {
                    button.isEnabled = false
                }
            }
        }
    }
    
    
    func emoji (_ card: Card) -> String {
        if nil == emojiCard[card.identifier] {
            let rand =  Int(arc4random_uniform(UInt32(emojiChoices.count - 1)))
            let index = emojiChoices.index(emojiChoices.startIndex, offsetBy: rand)
            emojiCard[card.identifier] = String(emojiChoices.remove(at: index))
        }
        return emojiCard[card.identifier] ?? "" 
    }
    
}

