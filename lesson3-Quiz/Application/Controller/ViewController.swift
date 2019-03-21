//
//  ViewController.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 16/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var players: Player!
    var enteredPlayerName = "Ivan"

    override func viewDidLoad() {
        super.viewDidLoad()

        Player.loadData { players in
            if let players = players {
                self.players =  players
            } else {
                let players = Player.loadData()
                self.players = players
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "start" else { return }

            let quizSelectionVC = segue.destination as! QuizSelectionVC
            players.withKey.updateValue([String : Player.QuizResult](), forKey: enteredPlayerName)
            quizSelectionVC.players = players
            quizSelectionVC.enteredPlayerName = enteredPlayerName
    
    }
    
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "start", sender: nil)
    }
    
}

