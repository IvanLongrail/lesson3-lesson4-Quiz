//
//  Qestion.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 17/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var responceProperty: ResponceProperty
    var timerProperty: TimerProperty
    var luckyProperty: LuckyProperty
    var scoreProperty: ScoreProperty
    var answers: [Answer]
    
    static func loadData() -> [Question] {
        
        var questionArray = [Question]()
        
        // 1-st question
        questionArray.append(Question(text: "В каком городе родился Лагутенко", responceProperty: .single, timerProperty: .standart, luckyProperty: .none, scoreProperty: .singleAnswer(withScore: 10),
                                      answers: [("Екатеринбург",.low),("Владивосток",.aboveAverage),("Санкт-Петербург",.middle),("Москва",.best)]))
        
        // 2-nd question
        questionArray.append(Question(text: "Кем работал в своей жизни Илья", responceProperty: .multipal, timerProperty: .double, luckyProperty: .none, scoreProperty: .equalProportion(whereMax: 10),
                                      answers: [("Ихтиолог",.low),("Певец",.best),("Переводчик",.aboveAverage),("В посольстве",.low)]))
        
        // 3-nd question
        questionArray.append(Question(text: "Сколько Илье лет", responceProperty: .range, timerProperty: .fast, luckyProperty: .none, scoreProperty: ScoreProperty(best: 10, aboveAverage: 0, middle: 0, low: 0), answers: [("40",.middle),("70",.best),("70",.low)]))
        
        // 4-th question
        questionArray.append(Question(text: "Название первого альбома", responceProperty: .single, timerProperty: .none, luckyProperty: .none, scoreProperty: ScoreProperty(best: 10, aboveAverage: 6, middle: 0, low: 0), answers: [("Новая луна апреля", .best),("Точно ртуть алоэ",.middle),("Морская",.aboveAverage),("Икра",.low)]))
        
        return questionArray
    }
    
    static func loadData(completion: ([Question]) -> Void) {
        
    }
}

