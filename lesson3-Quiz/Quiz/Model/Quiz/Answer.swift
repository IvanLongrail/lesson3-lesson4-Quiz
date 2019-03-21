//
//  Answer.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 17/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import Foundation

typealias ScoreType = Double

struct Answer {
    var text: String
    var score: ScoreType
    
    init(text: String, score: ScoreType) {
        self.text = text
        self.score = score
    }
}
