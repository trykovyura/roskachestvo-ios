//
// Created by Юрий Трыков on 20.06.2020.
//

import SwiftUI

struct AttributedText: UIViewRepresentable {
    var attributedText: NSAttributedString

    init(_ attributedText: NSAttributedString) {
        self.attributedText = attributedText
    }

    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }

    func updateUIView(_ label: UITextView, context: Context) {
        label.attributedText = attributedText
    }
}
