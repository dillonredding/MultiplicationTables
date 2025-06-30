import SwiftUI

struct PracticeView: View {
    let questions: [Question]

    @State private var questionIndex = 0
    @State private var value = 0
    @State private var correct = 0

    @State private var showingResults = false

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Spacer()
            Text("\(value)")
                .font(.largeTitle.bold())
            Spacer()
            KeypadInput(value: $value, onSubmit: answerQuestion)
        }
        .padding()
        .navigationTitle(currentQuestion.text)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Quit") {
                    dismiss()
                }
            }
        }
        .alert("\(correct) of \(questions.count) correct!", isPresented: $showingResults) {
            Button("OK") {
                dismiss()
            }
        }
    }

    var currentQuestion: Question {
        questions[questionIndex]
    }

    func answerQuestion() {
        if value == currentQuestion.answer {
            correct += 1
        }
        if questionIndex == questions.count - 1 {
            showingResults = true
        } else {
            withAnimation {
                questionIndex += 1
                value = 0
            }
        }
    }
}

#Preview {
    NavigationStack {
        PracticeView(questions: [
            Question(multiplicand: 2, multiplier: 2),
            Question(multiplicand: 2, multiplier: 3),
            Question(multiplicand: 2, multiplier: 4)
        ])
    }
}
