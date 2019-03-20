//
//  Quiz.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 17/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import Foundation

class Quiz {
    var authorName: String
    var quizName: String
    var creationDate: Date
    var questions: [Question]
    
    init(authorName: String, quizName: String, creationDate: Date, questions: [Question]) {
        self.authorName = authorName
        self.quizName = quizName
        self.creationDate = creationDate
        self.questions = questions
    }
    
    static func loadData() -> [Quiz] {
        var quizzes = [Quiz]()
        
        quizzes.append(Quiz(authorName: "Ivan", quizName: "Мумий Тролль. Илья Лагутенко", creationDate: Date(), questions: Question.loadData()))
        
        return quizzes
    }
    
    static func loadData(completion: @escaping ([Quiz]?) -> Void) {
//        let quizzes = loadData()
        completion(nil)
    }
    
    
}
