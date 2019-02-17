//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct ResearchPlainObject: Mappable {
    let name: String
    let url: String
    let category: String
    let anons: String
    let productIds: [String]
    let image: ImagePlainObject
    let statistics: ResearchStatisticPlainObject?
    let products: [ProductsPlainObject]

    init(map: Mapper) throws {
        name = try map.from("name")
        url = try map.from("url")
        category = try map.from("category")
        anons = try map.from("anons")
        productIds = try map.from("products")
        image = try map.from("image")
        statistics = map.optionalFrom("statistics")
        products = try map.from("products_info")
    }
}
