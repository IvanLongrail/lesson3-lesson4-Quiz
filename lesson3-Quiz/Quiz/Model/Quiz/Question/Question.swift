//
//  Qestion.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 17/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var responceProperty: ResponceProperty
    var timerProperty: TimerProperty
    var luckyProperty: LuckyProperty
    var scoreProperty: ScoreProperty
    var answers: [Answer]
    
    static func loadData(completion: ([Question]) -> Void) {
        
    }
}

