//
//  Triviaquiz.swift
//  Trivia
//
//  Created by Ermiyas H on 3/11/24.
//

import UIKit

// add mock data structure
struct quizQuestion{
    let question: String
    let choices: [String]
    let correctAnswerIndex: Int
}

class Triviaquiz: UIViewController {
    
    var quizQuestions : [quizQuestion] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mockUpData()
    }
    
    func mockUpData(){
        let question1 = quizQuestion(question: "What is the capital of Tigray?", choices:["London", "Paris", "Mekelle","Madrid"],correctAnswerIndex: 2)
        let question2 = quizQuestion(question: "who won the 2023 Ballon d'O?", choices:["Leo Messi", "C.Ronaldo", "Haaland","Vinicius Jr"],correctAnswerIndex: 0)
        let question3 = quizQuestion(question: "According to Guinness World Records, what's the best-selling book of all time?", choices:["Little Red Book", "Harry Potter and the Philosopher's Stone", "The Lord of the Rings","The bible"],correctAnswerIndex: 3)
        
        quizQuestions = [question1, question2, question3]
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
