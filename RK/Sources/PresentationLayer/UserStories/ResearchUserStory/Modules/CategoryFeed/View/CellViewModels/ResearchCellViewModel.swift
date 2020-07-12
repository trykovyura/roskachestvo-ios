//
// Created by Юрий Трыков on 2019-02-10.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation

struct ResearchCellViewModel {

    let id, name: String
    let image: URL?
    let summary: ResearchSummaryVO?

}
extension ResearchCellViewModel {
    init(vo: ResearchesVO) {
        self.id = vo.id.description
        self.name = vo.name
        self.image = URL(string: Constants.imagePrefix + (vo.image?.src ?? ""))
        self.summary = vo.summary
    }
}
