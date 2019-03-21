//
//  QuestionInit.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 19/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import Foundation

extension Question {
    
    init(text: String, responceProperty: ResponceProperty, timerProperty: TimerProperty, luckyProperty: LuckyProperty, scoreProperty: ScoreProperty, answers: [(String, ScoreEnum)]) {
        self.text = text
        self.responceProperty = responceProperty
        self.timerProperty = timerProperty
        self.luckyProperty = luckyProperty
        self.scoreProperty = scoreProperty
        var answerArray = [Answer]()
        for answer in answers {
            let i = answer.1
            switch i {
            case .best: answerArray.append(Answer(text: answer.0, score: scoreProperty.best))
            case .aboveAverage: answerArray.append(Answer(text: answer.0, score: scoreProperty.aboveAverage))
            case .middle: answerArray.append(Answer(text: answer.0, score: scoreProperty.middle))
            case .low: answerArray.append(Answer(text: answer.0, score: scoreProperty.low))
            }
        }
        self.answers = answerArray
    }
    
    init(text: String, responceProperty: ResponceProperty, timerProperty: TimerProperty, luckyProperty: LuckyProperty, scoreProperty: ScoreProperty) {
        self.text = text
        self.responceProperty = responceProperty
        self.timerProperty = timerProperty
        self.luckyProperty = luckyProperty
        self.scoreProperty = scoreProperty
        self.answers = [Answer]()
    }
}
