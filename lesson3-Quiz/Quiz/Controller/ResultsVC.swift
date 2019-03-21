//
//  ResultsVC.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 17/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {

    var rapidity: Player.PlayerScore!
    var luckiness: Player.PlayerScore!
    var totalScore: Player.PlayerScore!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rapidityLabel: UILabel!
    @IBOutlet weak var luckinessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        scoreLabel.text = String((totalScore! * 100).rounded() / 100)
        rapidityLabel.text = String("\((rapidity! * 100).rounded() / 100) сек")
        luckinessLabel.text = String((luckiness! * 100).rounded() / 100)
    }

}
