//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Ermiyas H on 3/11/24.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var choiceLable4: UILabel!
    @IBOutlet weak var choiceLable3: UILabel!
    @IBOutlet weak var choiceLable2: UILabel!
    @IBOutlet weak var choiceLable1: UILabel!
    @IBOutlet weak var triviaImageView: UIImageView!
    @IBOutlet weak var categoryLable: UILabel!
    @IBOutlet weak var questionNumberLable: UILabel!
    
    var triviaQuiz = Triviaquiz()
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func displayQuestions() {
        let currentQuestion = triviaQuiz.quizQuestions[currentQuestionIndex]

                categoryLable.text = "Category: General Knowledge"
                questionNumberLable.text = "Question \(currentQuestionIndex + 1): \(currentQuestion.question)"
                choiceLable1.text = currentQuestion.choices[0]
                choiceLable2.text = currentQuestion.choices[1]
                choiceLable3.text = currentQuestion.choices[2]
                choiceLable4.text = currentQuestion.choices[3]
    }

    @IBAction func choiceLabelTapped(_ sender: UITapGestureRecognizer) {
       
        guard let tappedLabel = sender.view as? UILabel else { return }

        
        if tappedLabel == choiceLable1 {
            handleChoiceSelection(index: 0)
        } else if tappedLabel == choiceLable2 {
            handleChoiceSelection(index: 1)
        } else if tappedLabel == choiceLable3 {
            handleChoiceSelection(index: 2)
        } else if tappedLabel == choiceLable4 {
            handleChoiceSelection(index: 3)
        }
    }

    func handleChoiceSelection(index: Int) {
        guard currentQuestionIndex < triviaQuiz.quizQuestions.count else {
                    print("Quiz completed!")
                    return
                }

                let currentQuestion = triviaQuiz.quizQuestions[currentQuestionIndex]

                if index == currentQuestion.correctAnswer.rawValue {
                    print("Correct Answer")
                } else {
                    print("Wrong Answer")
                }

                currentQuestionIndex += 1

                if currentQuestionIndex < triviaQuiz.quizQuestions.count {
                    displayQuestions()
                } else {
                    print("Quiz completed!")
                }
            }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

