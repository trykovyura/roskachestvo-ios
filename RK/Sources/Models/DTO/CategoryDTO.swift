//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation

struct CategoryDTO: Codable {
    let id: String?
    let name: String?
    let categories: [CategoryDTO]?
}
