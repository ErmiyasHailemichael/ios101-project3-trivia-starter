//
//  Triviaquiz.swift
//  Trivia
//
//  Created by Ermiyas H on 3/11/24.
//

import UIKit

// add mock data structure
struct TriviaQuestion {
    let question: String
    let choices: [String]
    let correctAnswerIndex: Int
    let category: String
    let image: UIImage?
    
    init(question: String, choices: [String], correctAnswerIndex: Int, category: String, imageName: String? = nil) {
        self.question = question
        self.choices = choices
        self.correctAnswerIndex = correctAnswerIndex
        self.category = category
        self.image = imageName != nil ? UIImage(named: imageName!) : nil
    }
}
