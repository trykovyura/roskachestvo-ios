//
// Created by Юрий Трыков on 08.08.2020.
//

import Foundation

enum Producer: Codable, Equatable {
    case bool(Bool)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
            return
        }
        if let string = try? container.decode(String.self) {
            self = .string(string)
            return
        }
        throw DecodingError.typeMismatch(Producer.self,
                DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Producer"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let bool):
            try container.encode(bool)
        case .string(let string):
            try container.encode(string)
        }
    }
}
