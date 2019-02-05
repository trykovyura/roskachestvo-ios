//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct ProductPlainObject: Mappable {
    let name: String
    let status: ProductType
    let producer: String
    let trademark: String
    let url: String
    let researchResults: String
    let violations: String?
    let properties: [ProductPropertyPlainObject]
    let indicators: [ProductIndicatorPlainObject]
    let pros: [String]
    let cons: [String]
    let image: ImagePlainObject

    init(map: Mapper) throws {
        name = try map.from("name")
        status = try map.from("status")
        producer = try map.from("producer")
        trademark = try map.from("trademark")
        url = try map.from("url")
        researchResults = try map.from("research_results")
        violations = try map.from("violations")
        properties = try map.from("properties")
        indicators = try map.from("indicators")
        pros = try map.from("+")
        cons = try map.from("-")
        image = try map.from("image")
    }
}
