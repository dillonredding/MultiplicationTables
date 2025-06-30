import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    let multiplicand: Int
    let multiplier: Int

    var text: String {
        "What is \(multiplicand) x \(multiplier)?"
    }

    var answer: Int {
        multiplicand * multiplier
    }
}
