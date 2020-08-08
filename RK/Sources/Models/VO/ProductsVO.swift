//
// Created by Юрий Трыков on 18.07.2020.
//

import Foundation

struct ProductsVO: Equatable, Identifiable {
    let id: Int
    let name: String
    let status: ProductType
    let barcode: String?
    let trademark: String?
    let producer: Producer?
    let category: Int?
    let url: String?
    let image: ImageVO?
}

extension ProductsVO {
    init?(dto: ProductsDTO) {
        guard let id = dto.id else {
            return nil
        }
        self.id = id
        self.name = dto.name ?? ""
        self.status = dto.status ?? .unknown
        self.barcode = dto.barcode
        self.trademark = dto.trademark
        self.producer = dto.producer
        self.category = dto.category
        self.url = dto.url
        self.image = dto.image.flatMap(ImageVO.init)
    }
}
