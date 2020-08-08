//
// Created by Юрий Трыков on 08.08.2020.
//

import Foundation

struct ProductIndicatorVO {
    let group: String?
    let name: String?
    let value: String?
}

extension ProductIndicatorVO: Identifiable {
    var id: String {
        name ?? UUID().uuidString
    }
}

extension ProductIndicatorVO {
    init(dto: ProductIndicatorDTO) {
        self.group = dto.group
        self.name = dto.name
        self.value = dto.value
    }
}
