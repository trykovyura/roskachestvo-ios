//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation

struct CategoriesDTO: Codable {
    let id: Int?
    let name: String?
    let time: Int64?
    let researches: [ResearchesDTO]?
}
extension CategoriesDTO: Identifiable {

}
