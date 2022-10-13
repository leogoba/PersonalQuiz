//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by leogoba on 13.10.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitch: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabels: [UILabel]!
    
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answers: [Answer] {
        questions[questionIndex].answers
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func multipleAnswerButtonPressed() {
    }
    
    
    @IBAction func rangedAnswerButtonPressed() {
    }
}

// MARK: - Private Methods
extension QuestionsViewController {
    private func updateUI() {
        // Hide everything - Скрывает все стэки
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden.toggle()
        }
        // Get current question - Получить текущий вопрос
        let currentQuestion = questions[questionIndex]
        // Set current question for question label - Взять из текущего элемента массива только его тайтл и поместить в лэйбл
        questionLabel.text = currentQuestion.title
        // Calculate progress - Вычислить текущий прогресс
        let totalProgress = Float(questionIndex) / Float(questions.count)
        // Set progress for questionProgressView - Задаем значение прогресса
        questionProgressView.setProgress(totalProgress, animated: true)
        // Set navigation title - Задаем тайлт навигейшена
        title = "Вопрос №\(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswer(for: currentQuestion.responceType)
    }
    
    private func showCurrentAnswer(for type: ResponceType) {
        switch type {
        case .single: showSingleStackView(with: answers)
        case .multiple:
            break
        case .ranged:
            break
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden.toggle()
        
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
}
