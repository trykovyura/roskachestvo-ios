//
// Created by Юрий Трыков on 08.08.2020.
//

import Foundation

struct ProductPropertyVO {
    let name: String?
    let value: String?
}
extension ProductPropertyVO {
    init(dto: ProductPropertyDTO) {
        self.name = dto.name
        self.value = dto.value
    }
}
