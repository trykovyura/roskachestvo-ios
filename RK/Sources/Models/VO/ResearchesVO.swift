//
// Created by Юрий Трыков on 05.07.2020.
//

import Foundation

struct ResearchesVO: Equatable, Identifiable {
    let id: Int
    let name: String
    let category: Int?
    let url: String?
    let utime: Int64?
    let image: ImageVO?
    let summary: ResearchSummaryVO?
}
extension ResearchesVO {
    init?(dto: ResearchesDTO) {
        guard let id = dto.id else {
            return nil
        }
        self.id = id
        self.name = dto.name ?? ""
        self.category = dto.category
        self.url = dto.url
        self.utime = dto.utime
        self.image = dto.image.flatMap(ImageVO.init)
        self.summary = dto.summary.flatMap(ResearchSummaryVO.init)
    }
}
