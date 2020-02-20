//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct ErrorPlainObject: Mappable {
    let code: Int
    let message: String

    init(map: Mapper) throws {
        code = try map.from("code")
        message = try map.from("message")
    }
}
