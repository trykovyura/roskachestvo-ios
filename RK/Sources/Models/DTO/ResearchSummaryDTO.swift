//
// Created by Юрий Трыков on 2019-03-10.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation

struct ResearchSummaryDTO: Codable, Equatable {
    let highQuality: String?
    let quality: String?
    let withSign: String?
    let withViolation: String?
}
