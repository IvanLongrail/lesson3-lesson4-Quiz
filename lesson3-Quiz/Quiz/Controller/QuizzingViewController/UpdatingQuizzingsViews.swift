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
        
        let title1 = currentQuestion.answers[0].text
        rengedSlider.minimumValue = Float(title1)!
        rengedLabels[1].text = title1
        
        let title0 = currentQuestion.answers[2].text
        rengedSlider.maximumValue = Float(title0)!
        rengedLabels[0].text = title0
        
        rengedLabels[2].text = String(Int(rengedSlider.value))
    }
    
//    @IBAction func doSomething(sender: UISlider, forEvent event: UIEvent.valueChanged) {
//
//    }
    
}
