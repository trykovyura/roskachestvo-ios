//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct ImagePlainObject: Mappable {

    let src: String
    let width: Int?
    let height: Int?
    let size: Int?

    init(map: Mapper) throws {
        src = try map.from("src")
        width = map.optionalFrom("width")
        height = map.optionalFrom("height")
        size = map.optionalFrom("size")
    }
}
