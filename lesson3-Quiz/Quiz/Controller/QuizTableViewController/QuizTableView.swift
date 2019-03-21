//
//  QuizTableViewExtension.swift
//  lesson3-Quiz
//
//  Created by Иван longrail on 19/03/2019.
//  Copyright © 2019 Иван longrail. All rights reserved.
//

import UIKit

extension QuizSelectionVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizTableViewCell", for: indexPath) as! QuizTableViewCell
        
        cell.authorLabel.text = quizzes[indexPath.row].authorName
        cell.guizNameLabel.text = quizzes[indexPath.row].quizName
        cell.dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "startQuizzing", sender: nil)
    }
    
}
