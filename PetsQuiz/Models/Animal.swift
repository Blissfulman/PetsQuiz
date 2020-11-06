//
//  Animal.swift
//  PetsQuiz
//
//  Created by User on 06.11.2020.
//  Copyright © 2020 Swiftbook. All rights reserved.
//

enum AnimalType: String {
    case dogs = "Собаки"
    case cats = "Кошки"
    case fish = "Рыбки"
    case bird = "Птицы"
}

struct AnimalKind {
    let name: String
    let image: String
    let description: String
}
    
struct Animal {
    let type: AnimalType
    let image: String
    let kinds: [AnimalKind]
    let questions: [Question]
}
