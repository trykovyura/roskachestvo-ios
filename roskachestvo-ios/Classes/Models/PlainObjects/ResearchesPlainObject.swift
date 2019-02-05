//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct ResearchesPlainObject: Mappable {

    let id: String
    let name: String
    let category: String
    let url: String
    let utime: Int64
    let image: ImagePlainObject

    init(map: Mapper) throws {
        id = try map.from("id")
        name = try map.from("name")
        category = try map.from("category")
        url = try map.from("url")
        utime = try map.from("utime")
        image = try map.from("image")
    }
}
