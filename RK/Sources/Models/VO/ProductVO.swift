//
// Created by Юрий Трыков on 08.08.2020.
//

import Foundation

struct ProductVO {
    let id: Int
    let name: String?
    let status: ProductType?
    let producer: String?
    let trademark: String?
    let url: String?
    let researchResults: String?
    let violations: String?
    let properties: [ProductPropertyVO]?
    let indicators: [ProductIndicatorVO]?
    let pros: [String]?
    let cons: [String]?
    let image: ImageVO?
}

extension ProductVO {
    init(id: Int, dto: ProductDTO) {
        self.id = id
        self.name = dto.name
        self.status = dto.status
        self.producer = dto.producer
        self.trademark = dto.trademark
        self.url = dto.url
        self.researchResults = dto.researchResults
        self.violations = dto.violations
        self.properties = dto.properties?.compactMap(ProductPropertyVO.init)
        self.indicators = dto.indicators?.compactMap(ProductIndicatorVO.init)
        self.pros = dto.pros
        self.cons = dto.cons
        self.image = dto.image.flatMap(ImageVO.init)
    }
}
