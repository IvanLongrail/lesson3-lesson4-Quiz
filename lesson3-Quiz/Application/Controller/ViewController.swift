//
//  ViewController.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 16/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var players: Player!// Dictionary = [ String : Player ]()
    var enteredPlayerName = "Ivan"
    
    //ВВЕСТИ ВВОД ИГРОКА

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Player.loadData { players in
            if let players = players {
                //var playerNames = [String]()
//                for pl in players {
//                    playerNames.append(pl.playerName)
//                }
                self.players =  players
            } else {
                let players = Player.loadData()
                self.players = players
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "start" else { return }
//        if let currentPlayer = players!.withKey[enteredPlayerName] {
            let quizSelectionVC = segue.destination as! QuizSelectionVC
            players.withKey.updateValue([String : Player.QuizResult](), forKey: enteredPlayerName)
            quizSelectionVC.players = players//players.filter { $0.playerName == enteredPlayerName }
            quizSelectionVC.enteredPlayerName = enteredPlayerName
    
    }
    
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "start", sender: nil)
    }
    
}

