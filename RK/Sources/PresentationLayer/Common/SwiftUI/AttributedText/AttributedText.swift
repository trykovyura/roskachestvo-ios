//
// Created by Юрий Трыков on 20.06.2020.
//

import SwiftUI

//struct AttributedText: UIViewRepresentable {
//    var attributedText: NSAttributedString?
//
//    init(_ attributedText: NSAttributedString?) {
//        self.attributedText = attributedText
//    }
//
//    init(_ attributedText: NSMutableAttributedString?) {
//        self.attributedText = attributedText
//    }
//
//    func makeUIView(context: Context) -> UITextView {
//        UITextView()
//    }
//
//    func updateUIView(_ label: UITextView, context: Context) {
//        label.attributedText = attributedText
//    }
//}
struct AttributedText: View {
    let content: String

    init(_ content: String) {
        self.content = content
    }

    var body: some View {
        formattedWithHTML(string: content)
    }

    private func formattedWithHTML(string: String) -> Text {
        let data = Data("<XML>\(string)</XML>".utf8)
        let parser = HTML2TextParser(data: data)
        parser.delegate = parser
        if parser.parse() {
            return parser.resultText
        }
        return Text("")
    }
}

private class HTML2TextParser: XMLParser, XMLParserDelegate {
    private var isBold = false
    private var isItalic = false
    var resultText = Text("")

    override init(data: Data) {
        super.init(data: data)
    }

    private func addChunkOfText(contentText: String) {
        guard contentText != "" else {
            return
        }
        var textChunk = Text(contentText)
        textChunk = isBold ? textChunk.bold() : textChunk
        textChunk = isItalic ? textChunk.italic() : textChunk
        //swiftlint:disable shorthand_operator
        resultText = resultText + textChunk
    }

    // MARK: - Delegate methods of XMLParserDelegate -
    func parser(_ parser: XMLParser, didStartElement elementName: String,
                namespaceURI: String?, qualifiedName qName: String?,
                attributes attributeDict: [String: String] = [:]) {
        if elementName.uppercased() == "B" {
            isBold = true
        } else if elementName.uppercased() == "I" {
            isItalic = true
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?,
                qualifiedName qName: String?) {
        if elementName.uppercased() == "B" {
            isBold = false
        } else if elementName.uppercased() == "I" {
            isItalic = false
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        addChunkOfText(contentText: string)
    }
}
