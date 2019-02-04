//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct ProductPropertyPlainObject: Mappable {
    let name: String
    let value: String

    init(map: Mapper) throws {
        self.name = try map.from("name")
        self.value = try map.value("name")
    }
}
