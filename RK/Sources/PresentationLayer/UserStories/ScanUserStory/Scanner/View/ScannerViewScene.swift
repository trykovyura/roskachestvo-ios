//
// Created by Юрий Трыков on 28.05.2020.
//

import SwiftUI

struct ScannerViewScene: UIViewControllerRepresentable {
    typealias BarCode = (String) -> Void
    var barCode: BarCode
    let vc = ScannerViewController()

    func makeUIViewController(context: Context) -> ScannerViewController {
        vc
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(vc: vc, bar: barCode)
    }
    class Coordinator: NSObject, ScannerViewControllerDelegate {
        var bar: BarCode
        init(vc: ScannerViewController, bar: @escaping BarCode) {
            self.bar = bar
            super.init()
            vc.delegate = self
        }
        func barCode(_ value: String) {
            bar(value)
        }
    }
}
