//
// Created by Юрий Трыков on 08.08.2020.
//

import SwiftUI

struct TextView: UIViewRepresentable {

    var text: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()

        textView.font = UIFont.systemFont(ofSize: 22)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true

        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.systemFont(ofSize: 22)
    }

}
