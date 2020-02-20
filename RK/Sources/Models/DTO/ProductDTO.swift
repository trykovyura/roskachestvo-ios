//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation

struct ProductDTO: Codable {
    let name: String?
    let status: ProductType?
    let producer: String?
    let trademark: String?
    let url: String?
    let researchResults: String?
    let violations: String?
    let properties: [ProductPropertyDTO]?
    let indicators: [ProductIndicatorDTO]?
    let pros: [String]?
    let cons: [String]?
    let image: ImageDTO?

    enum CodingKeys: String, CodingKey {
        case name
        case status
        case producer
        case trademark
        case url
        case researchResults = "research_results"
        case violations
        case properties
        case indicators
        case pros = "+"
        case cons = "-"
        case image
    }
}
