//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation

struct ProductIndicatorDTO: Codable {
    let group: String?
    let name: String?
    let value: String?

    enum CodingKeys: String, CodingKey {
        case group
        case name
        case value
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.group = try container.decode(String.self, forKey: .group)
        self.name = try container.decode(String.self, forKey: .name)
        if let number = try? container.decode(Double.self, forKey: .value) {
            value = String(number)
        } else {
            value = try container.decode(String.self, forKey: .value)
        }
    }
}
