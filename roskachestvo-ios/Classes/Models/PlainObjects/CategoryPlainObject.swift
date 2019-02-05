//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct CategoryPlainObject: Mappable {
    let id: String
    let name: String
    let categories: [CategoryPlainObject]?

    init(map: Mapper) throws {
        id = try map.from("id")
        name = try map.from("name")
        categories = map.optionalFrom("categories")
    }
}
