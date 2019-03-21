//
//  AnswerScore.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 18/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import Foundation

extension Question {
    enum ResponceProperty {
        case single, multipal, range
    }
    
    enum TimerProperty: Double { // seconds
        case none = 1 // 1/1 = 1, the coefficient does not affect the scoring
        case fast = 10
        case standart = 20
        case double = 40
    }
    
    enum LuckyProperty: Double { //score coefficient
        case none = 1
        case luckyCoeffitient = 2
    }
    
    enum ScoreEnum {
        case best, aboveAverage, middle, low
    }
    
    struct ScoreProperty {
        var best: ScoreType
        var aboveAverage: ScoreType
        var middle: ScoreType
        var low: ScoreType
        
        static func equalProportion(whereMax: Double) -> ScoreProperty {
            let best = whereMax
            let aboveAverage = whereMax / 2
            let middle =  0 - whereMax / 2
            let low: Double = 0 - whereMax
            return ScoreProperty(best: best, aboveAverage: aboveAverage, middle: middle, low: low)
        }
        
        static func singleAnswer(withScore: Double) -> ScoreProperty {
            let best = withScore
            let aboveAverage: Double = 0
            let middle: Double = 0
            let low: Double = 0
            return ScoreProperty(best: best, aboveAverage: aboveAverage, middle: middle, low: low)
        }
        
        init(best: Double, aboveAverage: Double, middle: Double, low: Double) {
            self.best = best
            self.aboveAverage = aboveAverage
            self.middle = middle
            self.low = low
        }
    }

}
