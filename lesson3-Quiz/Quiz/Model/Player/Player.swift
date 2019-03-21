//
//  Player.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 17/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import Foundation

class Player {
    
    var withKey: [  String : [ String : QuizResult]  ]
    
    init(playerName: String) {

        self.withKey = [ playerName : [ String : QuizResult ]() ]
    }
  
    struct QuizResult {
    
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
        completion(nil)
    }
    
    static func uploadData() {}
}
