//
//  Triviaquiz.swift
//  Trivia
//
//  Created by Ermiyas H on 3/11/24.
//

import UIKit

// add mock data structure
enum QuizOption: Int {
    case london = 0
    case paris = 1
    case mekelle = 2
    case madrid = 3
}

struct QuizQuestion {
    let question: String
    let choices: [String]
    let correctAnswer: QuizOption
}

class Triviaquiz: UIViewController {

    var quizQuestions: [QuizQuestion] = []
    var currentQuestionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        mockUpData()
        displayQuestions()
    }

    func mockUpData() {
        let question1 = QuizQuestion(question: "What is the capital of Tigray?", choices: ["London", "Paris", "Mekelle", "Madrid"], correctAnswer: .mekelle)
        let question2 = QuizQuestion(question: "Who won the 2023 Ballon d'Or?", choices: ["Leo Messi", "C.Ronaldo", "Haaland", "Vinicius Jr"], correctAnswer: .london)
        let question3 = QuizQuestion(question: "According to Guinness World Records, what's the best-selling book of all time?", choices: ["Little Red Book", "Harry Potter and the Philosopher's Stone", "The Lord of the Rings", "The Bible"], correctAnswer: .madrid)

        quizQuestions = [question1, question2, question3]
    }

    func displayQuestions() {
        guard currentQuestionIndex < quizQuestions.count else {
            print("Quiz completed!")
            return
        }

        let currentQuestion = quizQuestions[currentQuestionIndex]

        // Assuming you have outlets for the labels
        categoryLabel.text = "Category: General Knowledge" // Update with the actual category
        questionLabel.text = "Question \(currentQuestionIndex + 1): \(currentQuestion.question)"
        choiceLabel1.text = currentQuestion.choices[0]
        choiceLabel2.text = currentQuestion.choices[1]
        choiceLabel3.text = currentQuestion.choices[2]
        choiceLabel4.text = currentQuestion.choices[3]
    }

    func handleChoiceSelection(index: Int) {
        guard currentQuestionIndex < quizQuestions.count else {
            print("Quiz completed!")
            return
        }

        let currentQuestion = quizQuestions[currentQuestionIndex]

        if index == currentQuestion.correctAnswer.rawValue {
            print("Correct Answer")
        } else {
            print("Wrong Answer")
        }

        currentQuestionIndex += 1

        if currentQuestionIndex < quizQuestions.count {
            displayQuestions()
        } else {
            print("Quiz completed!")
        }
    }

    // Add the prepare(for segue:sender:) method if you plan to navigate to other view controllers
}
