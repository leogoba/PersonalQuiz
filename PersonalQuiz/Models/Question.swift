//
//  Question.swift
//  PersonalQuiz
//
//  Created by leogoba on 13.10.2022.
//

struct Question {
    let title: String
    let responceType: ResponceType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Какую пищу вы предпочитаете?",
                responceType: .single,
                answers: [
                    Answer(title: "Стейк", animal: .dog),
                    Answer(title: "Рыба", animal: .cat),
                    Answer(title: "Морковь", animal: .turtle),
                    Answer(title: "Капуста", animal: .rabbit)
                ]
            ),
            Question(
                title: "Что вам нравится больше?",
                responceType: .multiple,
                answers: [
                    Answer(title: "Плавать", animal: .dog),
                    Answer(title: "Спать", animal: .cat),
                    Answer(title: "Обниматься", animal: .rabbit),
                    Answer(title: "Есть", animal: .turtle)
                ]
            ),
            Question(
                title: "Любите ли вы поездки на машине?",
                responceType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .cat),
                    Answer(title: "Страшно, боюсь", animal: .turtle),
                    Answer(title: "Все равно", animal: .rabbit),
                    Answer(title: "Обожаю", animal: .dog)
                ]
            )
        ]
    }
}

enum ResponceType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let animal: Animal
}

enum Animal: Character {
    case dog = "🐶"
    case cat = "🐱"
    case turtle = "🐢"
    case rabbit = "🐰"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь"
        case .cat:
            return "Вы любите одиночество, подчинены самому себе, гуляете там, где хотите"
        case .turtle:
            return "Ваша сила в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях"
        case .rabbit:
            return "Вам нравится все мягкое, потому что вы сами мягкие. Вы здоровы и полны энергии"
        }
    }
}
