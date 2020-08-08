//
// Created by Юрий Трыков on 08.08.2020.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var text: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(text, baseURL: nil)
    }
}
