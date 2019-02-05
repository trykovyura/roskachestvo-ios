//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct ProductsPlainObject: Mappable {

    let status: ProductType
    let barcode: String?
    let trademark: String
    let id: String
    let name: String
    let producer: String
    let category: String
    let url: String
    let image: ImagePlainObject

    init(map: Mapper) throws {
        status = try map.from("status")
        barcode = map.optionalFrom("barcode")
        trademark = try map.from("trademark")
        id = try map.from("id")
        name = try map.from("name")
        producer = try map.from("producer")
        category = try map.from("category")
        url = try map.from("url")
        image = try map.from("image")

    }
}
