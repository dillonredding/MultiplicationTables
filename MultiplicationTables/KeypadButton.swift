import SwiftUI

struct KeypadButton: View {
    let text: String?
    let icon: String?
    let action: () -> Void

    init(text: String, action: @escaping () -> Void) {
        self.text = text
        self.action = action
        self.icon = nil
    }

    init(icon: String, action: @escaping () -> Void) {
        self.icon = icon
        self.action = action
        self.text = nil
    }

    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(.gray)
                    .frame(width: 100, height: 100)

                if let text {
                    Text(text)
                } else if let icon {
                    Image(systemName: icon)
                }
            }
        }
        .font(.title)
        .foregroundStyle(.white)
    }
}

#Preview {
    VStack {
        KeypadButton(text: "1", action: {})
        KeypadButton(text: "2", action: {})
        KeypadButton(icon: "delete.left", action: {})
        KeypadButton(icon: "return", action: {})
    }
}
