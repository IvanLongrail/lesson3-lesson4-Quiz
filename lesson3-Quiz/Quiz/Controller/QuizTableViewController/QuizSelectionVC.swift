//
//  QuizSelectionVC.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 17/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit

class QuizSelectionVC: UIViewController {
    var players: Player!//[ String : [Player.QuizResult] ]! // key (first element os dictionary) is String = "name of quiz"
    var enteredPlayerName: String!
    var quizzes: [Quiz]!
    //var quizzes: [Quiz] = Quiz.loadData()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Quiz.loadData { quizzes in
            if let quizzes = quizzes {
                self.quizzes = quizzes
                
            } else {
                self.quizzes = Quiz.loadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "startQuizzing" else { return }
        if let indexPath = tableView.indexPathForSelectedRow {
            let navigationController = segue.destination as! UINavigationController
            let quizzingViewController = navigationController.topViewController as! QuizzingVC
            let currentQuiz = self.quizzes![indexPath.row]
            quizzingViewController.quiz = currentQuiz
            
            players.withKey[enteredPlayerName]!.updateValue(Player.QuizResult(), forKey: currentQuiz.quizName)
            //player.quiz.append(quizName: currentQuiz.quizName, answers: [answerResult]())
            quizzingViewController.players = players
            quizzingViewController.enteredPlayerName = enteredPlayerName
            //quizzingViewController.quizName = currentQuiz.quizName
            
            
        } else { return }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }
}

