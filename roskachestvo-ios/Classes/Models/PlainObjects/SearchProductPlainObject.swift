//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct SearchProductPlainObject: Mappable {

    let id: String
    let name: String
    let url: String

    init(map: Mapper) throws {
        self.id = try map.from("id")
        self.name = try map.from("name")
        self.url = try map.from("url")
    }
}
