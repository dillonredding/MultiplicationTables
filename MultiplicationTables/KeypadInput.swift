import SwiftUI

struct KeypadInput: View {
    @Binding var value: Int

    let onSubmit: () -> Void

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            KeypadButton(text: "7") { append(7) }
            KeypadButton(text: "8") { append(8) }
            KeypadButton(text: "9") { append(9) }
            KeypadButton(text: "4") { append(4) }
            KeypadButton(text: "5") { append(5) }
            KeypadButton(text: "6") { append(6) }
            KeypadButton(text: "1") { append(1) }
            KeypadButton(text: "2") { append(2) }
            KeypadButton(text: "3") { append(3) }
            KeypadButton(icon: "delete.left", action: delete)
            KeypadButton(text: "0") { append(0) }
            KeypadButton(icon: "return.left", action: onSubmit)
        }
        .frame(maxWidth: .infinity)
    }

    func append(_ digit: Int) {
        if value == 0 {
            value = digit
        } else {
            value = value * 10 + digit
        }
    }

    func delete() {
        if value < 10 {
            value = 0
        } else {
            value /= 10
        }
    }
}

#Preview {
    @Previewable @State var value: Int = 0

    VStack {
        Spacer()
        Text("\(value)")
            .font(.title)
        Spacer()
        KeypadInput(value: $value, onSubmit: {})
    }
    .padding()
}
