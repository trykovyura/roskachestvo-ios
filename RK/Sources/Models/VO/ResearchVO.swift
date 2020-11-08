//
// Created by Юрий Трыков on 18.07.2020.
//

import Foundation

struct ResearchVO: Equatable, Identifiable {
    let id: String
    let name: String
    let url: String?
    let category: Int?
    let anons: String?
    let productIds: [String]?
    let image: ImageVO?
    let statistics: ResearchStatisticVO?
    let products: [ProductsVO]?
}

extension ResearchVO {
    init(id: String, dto: ResearchDTO) {
        self.id = id
        self.name = dto.name ?? ""
        self.url = dto.url
        self.category = dto.category
        self.anons = dto.anons
        self.productIds = dto.productIds
        self.image = dto.image.flatMap(ImageVO.init)
        self.statistics = dto.statistics.flatMap(ResearchStatisticVO.init)
        self.products = dto.products?.compactMap(ProductsVO.init)
    }
}
