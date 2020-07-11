//
// Created by Юрий Трыков on 05.07.2020.
//

import Foundation

struct ResearchSummaryVO: Equatable {
    let highQuality: String
    let quality: String
    let withSign: String
    let withViolation: String
}
extension ResearchSummaryVO {
    init(dto: ResearchSummaryDTO) {
        self.highQuality = dto.highQuality ?? "0"
        self.quality = dto.quality ?? "0"
        self.withSign = dto.withSign ?? "0"
        self.withViolation = dto.withViolation ?? "0"
    }
}
