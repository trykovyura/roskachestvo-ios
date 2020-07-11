//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation

struct ImageDTO {
    let src: String?
    let width: Int?
    let height: Int?
    let size: Int?
}

extension ImageDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case src
        case width
        case height
        case size
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        src = try values.decodeIfPresent(String.self, forKey: .src)
        do {
            self.width = try values.decodeIfPresent(Int.self, forKey: .width)
        } catch {
            self.width = Int(try values.decode(String.self, forKey: .width))
        }
        do {
            height = try values.decodeIfPresent(Int.self, forKey: .height)
        } catch {
            height = Int(try values.decode(String.self, forKey: .height))
        }
        do {
            size = try values.decodeIfPresent(Int.self, forKey: .size)
        } catch {
            size = Int(try values.decode(String.self, forKey: .size))
        }
    }
}
