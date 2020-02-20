//
// Created by Юрий Трыков on 2019-02-05.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation

struct ResearchesDTO: Codable {
    let id: String?
    let name: String?
    let category: String?
    let url: String?
    let utime: Int64?
    let image: ImageDTO?
    let summary: ResearchSummaryDTO?
}
