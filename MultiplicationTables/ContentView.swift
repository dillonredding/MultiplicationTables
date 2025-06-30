import SwiftUI

struct ContentView: View {
    @State private var settings = PracticeSettings()

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Stepper(
                        "\(settings.table) times table",
                        value: $settings.table,
                        in: 2...12
                    )

                    Picker("Questions", selection: $settings.questionCount) {
                        Text("5").tag(5)
                        Text("10").tag(10)
                        Text("15").tag(15)
                        Text("20").tag(20)
                    }
                }

                NavigationLink("Begin") {
                    PracticeView(questions: settings.makeQuestions())
                }
            }
            .navigationTitle("MultiplicationTables")
        }
    }
}

#Preview {
    ContentView()
}
