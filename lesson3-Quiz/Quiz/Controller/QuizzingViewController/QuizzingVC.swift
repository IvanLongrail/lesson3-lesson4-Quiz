//
//  QuizingVC.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 17/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit

class QuizzingVC: UIViewController {

    var players: Player!
    var enteredPlayerName: String!
    //var quizName: String!
    var quiz: Quiz!
    var indexOfCurrentQuestion = 0
    // СДЕЛАТЬ ВМЕСТО ИНДЕКСА ЦИКЛЫ WHILE ЧТОБЫ массив состоял всегда из непоказанных вопросов
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var countdownProgressView: UIProgressView!
    @IBOutlet weak var quizProgressView: UIProgressView!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet weak var rengedSlider: UISlider!
    @IBOutlet var rengedLabels: [UILabel]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        rangeStackView.isHidden = true
        multipleStackView.isHidden = true
        
        navigationItem.title = quiz.quizName
        
        let currentQuestion = quiz.questions[indexOfCurrentQuestion]
        
        questionLabel.text = """
        \(indexOfCurrentQuestion + 1) / \(quiz.questions.count)
        
        \(currentQuestion.text)
        """
        
        let totalProgress = Float(indexOfCurrentQuestion) / Float(quiz.questions.count)
        quizProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.responceProperty {
        case .single:
            singleStackView.isHidden = false
            updateSingleStack()
        case .range:
            rangeStackView.isHidden = false
            updateRangeStack()
        case .multipal:
            multipleStackView.isHidden = false
            updateMultipleStack()
        }
        
    }

}
