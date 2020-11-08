//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation

struct ResearchDTO: Codable {
    let name: String?
    let url: String?
    let category: Int?
    let anons: String?
    let productIds: [String]?
    let image: ImageDTO?
    let statistics: ResearchStatisticDTO?
    let products: [ProductsDTO]?

    enum CodingKeys: String, CodingKey {
        case name
        case url
        case category
        case anons
        case productIds = "products"
        case image
        case statistics
        case products = "products_info"
    }
}
