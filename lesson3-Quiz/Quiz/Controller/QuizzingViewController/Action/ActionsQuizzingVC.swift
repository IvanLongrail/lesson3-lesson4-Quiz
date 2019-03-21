//
//  Actions.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 20/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit

extension QuizzingVC {
        
    func nextQuestion() {
        indexOfCurrentQuestion += 1
        
        if indexOfCurrentQuestion < quiz.questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "getResult", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "getResult" else { return }
        
        let controller = segue.destination as! ResultsVC
        
        Player.uploadData()
        controller.totalScore = players.withKey[enteredPlayerName]![quiz.quizName]!.totalScore
        controller.rapidity = players.withKey[enteredPlayerName]![quiz.quizName]!.rapidity
        controller.luckiness = players.withKey[enteredPlayerName]![quiz.quizName]!.luckiness
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let currentQuizQuestion = quiz.questions[indexOfCurrentQuestion]
        let currentQuestionAnswers = currentQuizQuestion.answers
        let currentQuestionLucky = currentQuizQuestion.luckyProperty
        
        let time = getTime(from: timerCount)
        let luck = getLuck(from: currentQuestionLucky)
        let score = getScore(from: currentQuestionAnswers, sender: sender)

        let currentPlayerAnswerResult = Player.AnswerResult.init(time: time, luck: luck, score: score)

        players.withKey[enteredPlayerName]![quiz.quizName]!.answers.append(currentPlayerAnswerResult)
        
        if let timer = timer {
             timer.invalidate()
        }
        nextQuestion()
    }
}
