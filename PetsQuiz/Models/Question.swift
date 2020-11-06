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

extension Animal {
    static func getQuestions(for type: AnimalType) -> [Question] {
        switch type {
        case .dogs:
            return [
                Question(text: "Регулярно выгуливаю", isGood: true),
                Question(text: "Кормлю червями", isGood: false),
                Question(text: "Даю молоко", isGood: false),
                Question(text: "Не выпускаю из дома", isGood: false),
                Question(text: "Даю погрызть кость", isGood: true)
            ]
        case .cats:
            return [
                Question(text: "Разрешаю лазить по шторам", isGood: true),
                Question(text: "Регулярно купаю в ванной", isGood: false),
                Question(text: "Кормлю рыбой", isGood: true),
                Question(text: "Кормлю капустой", isGood: false),
                Question(text: "Не даю спать днём", isGood: false)
            ]
        case .fish:
            return [
                Question(text: "Держу на поводке", isGood: false),
                Question(text: "Слежу за чистотой аквариума", isGood: true),
                Question(text: "Регулярно глажу за ушком", isGood: false),
                Question(text: "Даю свежее мясо", isGood: false),
                Question(text: "Использую подачу кислорода", isGood: true)
            ]
        case .bird:
            return [
                Question(text: "Выпускаю на волю из клетки", isGood: true),
                Question(text: "Кормлю крупами", isGood: true),
                Question(text: "Запускаю в клетку кота", isGood: false),
                Question(text: "Держу в конуре", isGood: false),
                Question(text: "Есть поилка с водой", isGood: true)
            ]
        }
    }
}
