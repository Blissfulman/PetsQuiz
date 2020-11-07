//
//  Question.swift
//  PetsQuiz
//
//  Created by User on 06.11.2020.
//  Copyright © 2020 Swiftbook. All rights reserved.
//

struct Question {
    let text: String
    let isGood: Bool
}

struct Answer {
    let question: Question
    let isSelected: Bool
}
