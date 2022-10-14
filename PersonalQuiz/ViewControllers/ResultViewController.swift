//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by leogoba on 13.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabels: [UILabel]!
    
    var answerChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        logic()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

//MARK: - Private methods - Получаем итоговый результат
extension ResultViewController {
    private func logic() {
        var dogCount = 0
        var catCount = 0
        var turtleCount = 0
        var rabbitCount = 0
        
        for answer in answerChosen {
            switch answer.animal {
            case .dog:
                dogCount += 1
                resultLabels.first?.text = "Вы - \(Animal.dog.rawValue)"
                resultLabels.last?.text = "\(Animal.dog.definition)"
            case .cat: catCount += 1
                resultLabels.first?.text = "Вы - \(Animal.cat.rawValue)"
                resultLabels.last?.text = "\(Animal.cat.definition)"
            case .turtle: turtleCount += 1
                resultLabels.first?.text = "Вы - \(Animal.turtle.rawValue)"
                resultLabels.last?.text = "\(Animal.turtle.definition)"
            default: rabbitCount += 1
                resultLabels.first?.text = "Вы - \(Animal.rabbit.rawValue)"
                resultLabels.last?.text = "\(Animal.rabbit.definition)"
            }
        }
    }
}



