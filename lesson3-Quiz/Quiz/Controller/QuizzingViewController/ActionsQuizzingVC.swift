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
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentQuizQuestion = quiz.questions[indexOfCurrentQuestion]
        let currentQuestionAnswers = currentQuizQuestion.answers
        let currentQuestionTimer = currentQuizQuestion.timerProperty
        let currentQuestionLucky = currentQuizQuestion.luckyProperty
        
        let time = getTime(from: currentQuestionTimer)
        let luck = getLuck(from: currentQuestionLucky)
        
        let minCount = min(singleButtons.count, currentQuestionAnswers.count)
        for i in 0..<minCount {
            if singleButtons[i] == sender {
                //ВРЕМЕННО ПОКА НЕТ ТАЙМЕРА
   
                let score = Player.PlayerScore(currentQuestionAnswers[i].score)
                let currentPlayerAnswerResult = Player.AnswerResult.init(time: time, luck: luck, score: score)

                players.withKey[enteredPlayerName]![quiz.quizName]!.answers.append(currentPlayerAnswerResult)
                
//                print(#function,
//                      players.withKey[enteredPlayerName]![quiz.quizName]!.rapidity,
//                      players.withKey[enteredPlayerName]![quiz.quizName]!.luckiness,
//                      players.withKey[enteredPlayerName]![quiz.quizName]!.totalScore)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed(_ sender: UIButton) {
        let currentQuizQuestion = quiz.questions[indexOfCurrentQuestion]
        let currentQuestionAnswers = currentQuizQuestion.answers
        let currentQuestionTimer = currentQuizQuestion.timerProperty
        let currentQuestionLucky = currentQuizQuestion.luckyProperty
        
        //ВРЕМЕННО ПОКА НЕТ ТАЙМЕРА
        let time = getTime(from: currentQuestionTimer)
        let luck = getLuck(from: currentQuestionLucky)
        
        var score: Player.PlayerScore = 0
        let minCount = min(multipleSwitches.count, currentQuestionAnswers.count)
        for i in 0..<minCount {
            if multipleSwitches[i].isOn {
                score += Player.PlayerScore(currentQuestionAnswers[i].score)
            }
        }
        
        let currentPlayerAnswerResult = Player.AnswerResult.init(time: time, luck: luck, score: score)
        
        players.withKey[enteredPlayerName]![quiz.quizName]!.answers.append(currentPlayerAnswerResult)
        
        nextQuestion()
    }
    
    
    @IBAction func rangeAnswerButtonPressed(_ sender: UIButton) {
        let currentQuizQuestion = quiz.questions[indexOfCurrentQuestion]
        let currentQuestionAnswers = currentQuizQuestion.answers
        let currentQuestionTimer = currentQuizQuestion.timerProperty
        let currentQuestionLucky = currentQuizQuestion.luckyProperty
        
        //ВРЕМЕННО ПОКА НЕТ ТАЙМЕРА
        let time = getTime(from: currentQuestionTimer)
        let luck = getLuck(from: currentQuestionLucky)
        
        var score: Player.PlayerScore = 0
        if  let min = Double(currentQuestionAnswers[0].text),
            let best = Double(currentQuestionAnswers[1].text),
            let max = Double(currentQuestionAnswers[2].text) {
            
            let renged = Player.PlayerScore(rengedSlider.value)
            if (max - best) >= (best - min) {
                let coeffitient = currentQuestionAnswers[1].score / (max - best)
                score = currentQuestionAnswers[1].score - abs((max - min) * renged + min - best) * coeffitient
            } else {
                let coeffitient = currentQuestionAnswers[1].score / (best - min)
                score = currentQuestionAnswers[1].score - abs((max - min) * renged + min - best) * coeffitient
            }
        }
        
        let currentPlayerAnswerResult = Player.AnswerResult.init(time: time, luck: luck, score: score)
        
        players.withKey[enteredPlayerName]![quiz.quizName]!.answers.append(currentPlayerAnswerResult)
        
        nextQuestion()
    }
    
    func getTime(from currentQuestionTimer: Question.TimerProperty) -> Player.PlayerTime {
        return Player.PlayerTime.init(remains: currentQuestionTimer.rawValue, spent: 0)
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
    
//    func getScore(from currentQuestionAnswers: [Answer], sender: UIButton) -> Player.PlayerScore {
//
//    }
//
}
