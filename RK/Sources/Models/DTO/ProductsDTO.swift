//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation

struct ProductsDTO: Codable {
    let status: ProductType?
    let barcode: String?
    let trademark: String?
    let id: String?
    let name: String?
    let producer: String?
    let category: String?
    let url: String?
    let image: ImageDTO?
}
