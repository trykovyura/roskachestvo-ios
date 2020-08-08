//
// Created by Юрий Трыков on 08.08.2020.
//

import Foundation

extension Actions {
    enum ProductDetailsAction: Action {
        case start(productId: Int)
        case error(Error)
        case success(ProductVO)
    }
}
