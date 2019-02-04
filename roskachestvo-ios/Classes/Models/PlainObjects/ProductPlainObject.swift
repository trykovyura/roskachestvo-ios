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
}
