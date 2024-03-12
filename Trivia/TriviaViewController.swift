//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Ermiyas H on 3/11/24.
//

import UIKit

class TriviaViewController: UIViewController {

   
    @IBOutlet weak var choice4: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var triviaImageView: UIImageView!
    @IBOutlet weak var categoryLable: UILabel!
    @IBOutlet weak var questionNumberLable: UILabel!
    

    var triviaQuestions: [TriviaQuestion] = []
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let question1 = TriviaQuestion(
                question: "What occasion corresponds to the longest day of the year?",
                choices: ["pring Equinox", "Autumnal Equinox", "The summer solstice", "Winter Solstice"],
                correctAnswerIndex: 2,
                category: "Astronomy",
                imageName: "Astronomy"
            )

            let question2 = TriviaQuestion(
                question: "Which planet is known as the Red Planet?",
                choices: ["Earth", "Mars", "Jupiter", "Venus"],
                correctAnswerIndex: 1,
                category: "Space",
                imageName: "mars_planet"
            )

            let question3 = TriviaQuestion(
                question: "Who wrote 'Romeo and Juliet'?",
                choices: ["Charles Dickens", "Jane Austen", "William Shakespeare", "Homer"],
                correctAnswerIndex: 2,
                category: "Literature",
                imageName: "shakespeare"
            )

            let question4 = TriviaQuestion(
                question: "Which country is famous for its pyramids?",
                choices: ["Greece", "Mexico", "Egypt", "India"],
                correctAnswerIndex: 2,
                category: "History",
                imageName: "pyramids"
            )

            let question5 = TriviaQuestion(
                question: "What is the largest mammal on Earth?",
                choices: ["Elephant", "Blue Whale", "Giraffe", "Hippopotamus"],
                correctAnswerIndex: 1,
                category: "Animals",
                imageName: "blue_whale"
            )

            triviaQuestions = [question1, question2, question3, question4, question5]

            setupUIForCurrentQuestion()
        }
    
    func setupUIForCurrentQuestion() {
        let currentQuestion = triviaQuestions[currentQuestionIndex]

        triviaImageView.image = imageFromText(text: currentQuestion.question)

        choice1.setTitle(currentQuestion.choices[0], for: .normal)
        choice2.setTitle(currentQuestion.choices[1], for: .normal)
        choice3.setTitle(currentQuestion.choices[2], for: .normal)
        choice4.setTitle(currentQuestion.choices[3], for: .normal)

        categoryLable.text = currentQuestion.category
        questionNumberLable.text = "Question \(currentQuestionIndex + 1)"
    }



    func imageFromText(text: String) -> UIImage? {
        let font = UIFont.systemFont(ofSize: 30)
        let size = CGSize(width: 300, height: 200)
        let renderer = UIGraphicsImageRenderer(size: size)

        let image = renderer.image { context in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            let attrs: [NSAttributedString.Key: Any] = [
                .font: font,
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor.black
            ]

            let attributedString = NSAttributedString(string: text, attributes: attrs)
            attributedString.draw(with: CGRect(origin: CGPoint(x: 0, y: 0), size: size), options: .usesLineFragmentOrigin, context: nil)
        }

        return image
    }

    @IBAction func choiceButtonTapped(_ sender: UIButton) {
        let selectedChoiceIndex = sender.tag

        let currentQuestion = triviaQuestions[currentQuestionIndex]

        // Print for debugging
        print("Selected choice index: \(selectedChoiceIndex)")
        print("Correct answer index: \(currentQuestion.correctAnswerIndex)")

        if selectedChoiceIndex == currentQuestion.correctAnswerIndex {
            print("Correct!")

        } else {
            print("Incorrect!")

        }

        currentQuestionIndex += 1

        if currentQuestionIndex < triviaQuestions.count {
            
            setupUIForCurrentQuestion()
        } else {
            
            showResultAlert()
        }
    }

        func showResultAlert() {
            let resultString = "Game Over!\nYou've completed the quiz."
            let alertController = UIAlertController(title: "Game Over", message: resultString, preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                       
            self.restartGame()
            }

            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
                }
    func restartGame() {
            currentQuestionIndex = 0
            setupUIForCurrentQuestion()
        }

}

