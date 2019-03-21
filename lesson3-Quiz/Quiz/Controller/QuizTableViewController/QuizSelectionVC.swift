//
//  QuizSelectionVC.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 17/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit

class QuizSelectionVC: UIViewController {
    var players: Player!
    var enteredPlayerName: String!
    var quizzes: [Quiz]!
    
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
    
            quizzingViewController.players = players
            quizzingViewController.enteredPlayerName = enteredPlayerName
          
        } else { return }
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval)
    {
        self.tableView.layoutIfNeeded()//updateConstraints()
        self.tableView.updateConstraints()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.tableView.layoutIfNeeded()
        self.tableView.updateConstraints()
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }
}

