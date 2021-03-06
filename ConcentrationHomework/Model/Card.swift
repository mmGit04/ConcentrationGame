//
//  Card.swift
//  ConcentrationHomework
//
//  Created by Mina Milosavljevic on 2/12/20.
//  Copyright © 2020 Mina Milosavljevic. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var isOpened: Bool = false
    
    let identifier: Int = {
       id += 1
       return id
    }()
    
    static var id:Int = 0
}
