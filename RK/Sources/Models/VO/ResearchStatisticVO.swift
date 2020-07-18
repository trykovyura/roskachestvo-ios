//
// Created by Юрий Трыков on 18.07.2020.
//

import Foundation

struct ResearchStatisticVO: Equatable {
    let methods: String?
    let regions: String?
    let shops: String?
    let protocols: String?
}

extension ResearchStatisticVO {
    init?(dto: ResearchStatisticDTO) {
        self.methods = dto.methods
        self.regions = dto.regions
        self.shops = dto.shops
        self.protocols = dto.protocols
    }
}
