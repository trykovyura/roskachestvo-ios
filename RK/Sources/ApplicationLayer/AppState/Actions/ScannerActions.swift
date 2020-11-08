//
// Created by Юрий Трыков on 30.05.2020.
//

import Foundation

extension Actions {
    enum ScannerAction: Action {
        case toggleScannerDetails(Bool)
    }
    enum BarCodeAction: Action {
        case barCodeScannerDetails(barCode: String)
        case error(Error)
        case success(productId: Int)
    }
}
