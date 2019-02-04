//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct ProductIndicatorPlainObject: Mappable {
    let group: String
    let name: String
    let value: String

    init(map: Mapper) throws {
        self.group = try map.from("group")
        self.name = try map.from("name")
        self.value = try map.from("value")
    }
}
