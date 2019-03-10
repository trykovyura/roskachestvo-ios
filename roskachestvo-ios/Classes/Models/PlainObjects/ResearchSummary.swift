//
// Created by Юрий Трыков on 2019-03-10.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Mapper

struct ResearchSummary: Mappable {

    let highQuality: String?
    let quality: String?
    let withSign: String?
    let withViolation: String?

    init(map: Mapper) throws {
        highQuality = map.optionalFrom("highquality")
        quality = map.optionalFrom("quality")
        withSign = map.optionalFrom("withsign")
        withViolation = map.optionalFrom("withviolation")
    }
}

extension ResearchSummary: Equatable {

    public static func == (lhs: ResearchSummary, rhs: ResearchSummary) -> Bool {
        return lhs.highQuality == rhs.highQuality &&
                lhs.quality == rhs.quality &&
                lhs.withSign == rhs.withSign &&
                lhs.withViolation == rhs.withViolation
    }
}
