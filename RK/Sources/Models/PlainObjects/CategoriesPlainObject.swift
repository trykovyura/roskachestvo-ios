//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct CategoriesPlainObject: Mappable {
    let id: Int
    let name: String
    let time: Int64
    let researches: [ResearchesPlainObject]

    init(map: Mapper) throws {
        id = try map.from("id")
        name = try map.from("name")
        time = try map.from("utime")
        researches = try map.from("researches")
    }
}
