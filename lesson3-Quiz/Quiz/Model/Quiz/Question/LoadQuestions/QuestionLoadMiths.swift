//
//  QuestionLoadMiths.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 21/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import Foundation

extension Question {
    
    static func loadDataMiths() -> [Question] {
        
        var questionArray = [Question]()
        
        // 1-st question
        questionArray.append(Question(text: "Что согласно легендам, находится в центре мира, на острове Буяне, посреди моря-океана?", responceProperty: .single, timerProperty: .standart, luckyProperty: .none, scoreProperty: .singleAnswer(withScore: 10),
                                      answers: [("Яйцо Кащея",.low),("Алатырь-Камень",.best),("Точка опоры Архимеда",.middle),("Аленький Цветочек",.best)]))
        
        // 2-nd question
        questionArray.append(Question(text: "Как называлась пища греческих богов, давшая им вечную юность и бессмертие?", responceProperty: .multipal, timerProperty: .double, luckyProperty: .none, scoreProperty: .equalProportion(whereMax: 10),
                                      answers: [("Нектар",.low),("Ксерофит",.best),("Амброзия",.aboveAverage),("Оливье",.low)]))
        
        // 3-nd question
        questionArray.append(Question(text: "Когда древние римляне рассматривали этот цветок, он напоминал им цвет и колебание звезд. Что это за цветок?", responceProperty: .single, timerProperty: .double, luckyProperty: .none, scoreProperty: .singleAnswer(withScore: 10), answers: [("Роза", .low),("Адонис",.middle),("Чертополох",.aboveAverage),("Астра",.best)]))
        
        // 4-th question
        questionArray.append(Question(text: "А какое животное помогло первому человеку спуститься на землю с небес по африканской легенде?", responceProperty: .single, timerProperty: .none, luckyProperty: .none, scoreProperty: .singleAnswer(withScore: 10), answers: [("Барсук", .low),("Змея",.middle),("Жираф",.best),("Мангуст",.aboveAverage)]))
        
        // 5-th question
        questionArray.append(Question(text: "Сколько дней смеялся Зевс сразу после рождения? Именно поэтому эта цифра считается священной.", responceProperty: .range, timerProperty: .fast, luckyProperty: .none, scoreProperty: ScoreProperty(best: 10, aboveAverage: 0, middle: 0, low: 0), answers: [("2",.low),("7",.best),("9",.low)]))
        
        // 6-th question
        questionArray.append(Question(text: "Кем был Микула Селянинович, согласно русским былинам новгородского цикла?", responceProperty: .multipal, timerProperty: .double, luckyProperty: .none, scoreProperty: ScoreProperty(best: 10, aboveAverage: 10, middle: -10, low: -10),
                                      answers: [("Странником",.low),("Богатырем",.best),("Пахарем",.aboveAverage),("Безработным",.middle)]))
        
        // 7-th question
        questionArray.append(Question(text: "Голова какого греческого бога, или изображение божественного жезла, встречается на фасадах банков?", responceProperty: .single, timerProperty: .standart, luckyProperty: .none, scoreProperty: ScoreProperty(best: 10, aboveAverage: -2, middle: 0, low: 0), answers: [("Гермес", .best),("Эрот",.middle),("Артемида",.low),("Фобос",.aboveAverage)]))
        
        // 8-th question
        questionArray.append(Question(text: "Сколько подвигов совершил Геракл, пока служил Эврисфею?", responceProperty: .range, timerProperty: .fast, luckyProperty: .none, scoreProperty: ScoreProperty(best: 10, aboveAverage: 0, middle: 0, low: 0), answers: [("7",.low),("12",.best),("21",.low)]))
        
        // 9-th question
        questionArray.append(Question(text: "Кто из нижеперечисленных Богинь являлись женами Зевса?", responceProperty: .multipal, timerProperty: .double, luckyProperty: .none, scoreProperty: ScoreProperty(best: 3, aboveAverage: 3, middle: 3, low: -5),
                                      answers: [("Гера",.aboveAverage),("Фемида",.best),("Геба",.low),("Метида",.middle)]))
        
        // 10-th question
        questionArray.append(Question(text: "Полубог древних славян Полкан бы наполовину человеком, а наполовину?", responceProperty: .single, timerProperty: .none, luckyProperty: .none, scoreProperty: .singleAnswer(withScore: 10), answers: [("Рысь", .best),("Камень",.middle),("Кащей",.low),("Леший",.aboveAverage)]))
        
        return questionArray
    }

    
}
