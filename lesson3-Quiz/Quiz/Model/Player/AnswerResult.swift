//
//  AnswerResult.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 20/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import Foundation


extension Player {
    
    struct AnswerResult {
        var time: PlayerTime
        var timeMultiplier: Double {
            return time.remains / (time.remains + time.spent)
        }
        var luck: PlayerLuck
        var score: PlayerScore
    }
    
    struct PlayerTime {
        var remains: Double
        var spent: Double
    }
    
    typealias PlayerLuck = (isActive: Bool, value: Double)
    typealias PlayerScore = Double
}
