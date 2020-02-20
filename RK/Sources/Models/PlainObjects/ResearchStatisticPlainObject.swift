//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct ResearchStatisticPlainObject: Mappable {
    let methods: String
    let regions: String
    let shops: String
    let protocols: String

    init(map: Mapper) throws {
        methods = try map.from("methods")
        regions = try map.from("regions")
        shops = try map.from("shops")
        protocols = try map.from("protocols")
    }
}
