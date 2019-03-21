//
//  QuestionLoads.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 21/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import Foundation

extension Question {
    
    static func loadDataMusicBox() -> [Question] {
        
        var questionArray = [Question]()
        
        // 1-st question
        questionArray.append(Question(text: "В каком году увидела свет первая пластинка группы The Beatles «Please, Please Me»?", responceProperty: .range, timerProperty: .fast, luckyProperty: .none, scoreProperty: ScoreProperty(best: 10, aboveAverage: 0, middle: 0, low: 0), answers: [("1959",.low),("1963",.best),("1976",.low)]))
        
        // 2-nd question
        questionArray.append(Question(text: "На какую песню из дебютного альбома сняли первый клип для певицы Земфира, но он так и не увидел свет на российском телевидении?", responceProperty: .single, timerProperty: .fast, luckyProperty: .none, scoreProperty: .singleAnswer(withScore: 10), answers: [("Ромашки", .low),("Аривидерчи",.middle),("Спид",.best),("Почему",.aboveAverage)]))
        
        // 3-nd question
        questionArray.append(Question(text: "Что такое осень согласно тексту группы ДДТ?", responceProperty: .multipal, timerProperty: .double, luckyProperty: .none, scoreProperty: ScoreProperty(best: 3, aboveAverage: 3, middle: 3, low: -6),
                                      answers: [("Это слезы",.low),("Это небо",.best),("Это камни",.aboveAverage),("Это ветер",.middle)]))
    
        // 4-th question
        questionArray.append(Question(text: "Какой первый официальный сингл выпустила Мадонна в 1983 году?", responceProperty: .single, timerProperty: .double, luckyProperty: .none, scoreProperty: .singleAnswer(withScore: 10), answers: [("I’m Going Bananas", .low),("Everybody",.best),("La Isla Bonita",.middle),("Masterpiece",.aboveAverage)]))
        
        // 5-th question
        questionArray.append(Question(text: "Какое место заняла Алла Пугачева на конкурсе Евровидение в 1997 году?", responceProperty: .range, timerProperty: .none, luckyProperty: .none, scoreProperty: ScoreProperty(best: 10, aboveAverage: 0, middle: 0, low: 0), answers: [("1",.low),("15",.best),("25",.low)]))
        
        return questionArray
    }
    
}
