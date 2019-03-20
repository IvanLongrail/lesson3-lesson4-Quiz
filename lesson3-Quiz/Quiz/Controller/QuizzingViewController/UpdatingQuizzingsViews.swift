//
//  ExtensionQuizzingVCForDataProcessing.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 20/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit

extension QuizzingVC {
    
    
    func updateSingleStack () {
        let currentQuestion = quiz.questions[indexOfCurrentQuestion]
        let minCount = min(singleButtons.count, currentQuestion.answers.count)
        
        for i in 0..<minCount {
            let title = currentQuestion.answers[i].text
            singleButtons[i].setTitle(title, for: [])
        }
    }
    
    func updateMultipleStack () {
        let currentQuestion = quiz.questions[indexOfCurrentQuestion]
        let minCount = min(multipleLabels.count, currentQuestion.answers.count)
        
        for i in 0..<minCount {
            let text = currentQuestion.answers[i].text
            multipleLabels[i].text = text
        }
    }
    
    func updateRangeStack () {
        let currentQuestion = quiz.questions[indexOfCurrentQuestion]
        guard currentQuestion.answers.count == 3 else { return }
        
        var title = currentQuestion.answers[0].text
        rengedLabels[1].text = title
        title = currentQuestion.answers[2].text
        rengedLabels[0].text = title
    }
}
