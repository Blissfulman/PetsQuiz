//
//  Animal.swift
//  PetsQuiz
//
//  Created by User on 06.11.2020.
//  Copyright © 2020 Swiftbook. All rights reserved.
//

enum PetType: String, CaseIterable {
    case dogs = "Собаки"
    case cats = "Кошки"
    case fish = "Рыбки"
    case birds = "Птицы"
    
    var definition: (goodOwner: String, badOwner: String) {
        switch self {
        case .dogs:
            return ("Ваша собака может быть счастлива с таким хозяином.",
                    "Не удивляйтесь если когда-нибудь ваша собака убежит и не вернётся. Вам стоило бы быть более внимательным к ней.")
        case .cats:
            return ("Вы замурчательный хозяин.",
                    "Не оставляйте обувь на виду вашего питомца. Иначе вам же хуже будет.")
        case .fish:
            return ("Если б рыбы умели говорить, они бы сказали вам \"Спасибо!\".",
                    "Вам лучше не опускать руку в аквариум. Вы рискуете быть покусанными.")
        case .birds:
            return ("Вашей причке повезло - вы внимательны и чутки к ней.",
                    "Если б вы понимали что чирикает ваша птичка когда обращается к вам, вам бы вряд ли это понравилось.")
        }
    }
}
    
struct Pet {
    let type: PetType
    let questions: [Question]
}

extension Pet {
    static func getQuestions(for type: PetType) -> [Question] {
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
        case .birds:
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
