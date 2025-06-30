import SwiftUI

@Observable
class PracticeSettings {
    var table: Int
    var questionCount: Int

    init(table: Int = 2, questionCount: Int = 5) {
        self.table = table
        self.questionCount = questionCount
    }

    func makeQuestions() -> [Question] {
        var questions = [Question]()
        for _ in 1...questionCount {
            questions.append(
                Question(multiplicand: table, multiplier: Int.random(in: 1...12))
            )
        }
        return questions
    }
}
