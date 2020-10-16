//
//  Theme.swift
//  ConcentrationHomework
//
//  Created by Mina Milosavljevic on 2/12/20.
//  Copyright © 2020 Mina Milosavljevic. All rights reserved.
//

import Foundation

struct Theme {
    static let emojiThemes = [String] (arrayLiteral: "🐱🐭🐹🦊🐻🐼🐨🐯🐣🐤🦇🐞",
                                       "😃😘😎🥵🥶😱😡🥳😭🤓",
                                       "💰🛢☎️🎞📷💾💿⌚️💻🖨")
    static func getTheme() -> String {
        let rand = Int.random(in: 0 ..< emojiThemes.count)
        return emojiThemes[rand]
    }
}
