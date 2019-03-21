//
//  File.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 21/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit

extension QuizzingVC {
    
    func getTime(from timerCount: (Double,Double)) -> Player.PlayerTime {
        return Player.PlayerTime.init(remains: timerCount.1, spent: timerCount.1 - timerCount.0)
    }
    
    func getLuck(from currentQuestionLucky: Question.LuckyProperty) -> Player.PlayerLuck {
        let luck: Player.PlayerLuck!
        switch currentQuestionLucky {
        case .none:
            luck = Player.PlayerLuck(isActive: false, value: currentQuestionLucky.rawValue )
        case .luckyCoeffitient:
            luck = Player.PlayerLuck(isActive: true, value: currentQuestionLucky.rawValue )
        }
        return luck
    }
    
    func getScore(from currentQuestionAnswers: [Answer], sender: UIButton) -> Player.PlayerScore {
        
        var score: Player.PlayerScore = 0
        if sender == rengedButton {
            if  let min = ScoreType(currentQuestionAnswers[0].text),
                let best = ScoreType(currentQuestionAnswers[1].text),
                let max = ScoreType(currentQuestionAnswers[2].text) {
                
                let renged = ScoreType(Int(rengedSlider.value))
                if (max - best) >= (best - min) {
                    let coeffitient = currentQuestionAnswers[1].score / (max - best)
                    score = currentQuestionAnswers[1].score - abs(best - renged) * coeffitient
                } else {
                    let coeffitient = currentQuestionAnswers[1].score / (best - min)
                    score = currentQuestionAnswers[1].score - abs(best - renged) * coeffitient
                }
            }
            
        } else if sender == multipleButton {
            let minCount = min(multipleSwitches.count, currentQuestionAnswers.count)
            for i in 0..<minCount {
                if multipleSwitches[i].isOn {
                    score += Player.PlayerScore(currentQuestionAnswers[i].score)
                }
            }
            
        } else {
            let minCount = min(singleButtons.count, currentQuestionAnswers.count)
            for i in 0..<minCount {
                if sender == singleButtons[i] {
                    score = Player.PlayerScore(currentQuestionAnswers[i].score)
                }
            }
        }
        
        return score
    }
}
