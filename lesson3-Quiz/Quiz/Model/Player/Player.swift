//
//  Player.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 17/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import Foundation

class Player {
//    var playerName: String
//    var quizResult: [QuizResult]
    var withKey: [  String : [ String : QuizResult]  ]
    
    init(playerName: String) {
//        self.playerName = playerName
//        self.quiz = [QuizResult]()
        //self.quizResult = [playerName : [QuizResult]() ]
        self.withKey = [ playerName : [ String : QuizResult ]() ]
    }
    
//    init(playerName: String, quiz: QuizResult) {
//        self.playerName = playerName
//        self.quiz = [QuizResult]()
//        self.quiz.append(quiz)
//    }
    
    struct QuizResult {
        //var quizName: String
        var answers: [AnswerResult]
        
        var rapidity: Double { // total time spent on quiz
            return answers.reduce(0, { $0 + $1.time.spent})
        }
        
        var luckiness: Double {
            return answers.filter({$0.luck.isActive}).reduce(0, {$0 + ($1.luck.value - 1) * $1.score} )
        }
        
        var totalScore: Double {
            return answers.reduce(0, {$0 + $1.score * $1.timeMultiplier * $1.luck.value})
        }
        
        init() {
            self.answers = [AnswerResult]()
        }
    }
    
    
    
    static func loadData() -> Player {
        return Player(playerName: "Ivan")
    }
    
    static func loadData(completion: @escaping (Player?) -> Void) {
        //        let quizzes = loadData()
        completion(nil)
    }
    
    static func uploadData() {}
}
    
//            var luckyScore: Double = 0
//            for answer in answers.filter({$0.luck.isActive}) {
//                luckyScore += (answer.luck.value - 1) * answer.score
//            }
//            return luckyScore
//
        
        
        
//            var score: Double = 0
//            for answer in answers {
//                score += answer.score * answer.timeMultiplier * answer.luck.value
//            }
//            return score
