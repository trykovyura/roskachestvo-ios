//
// Created by Юрий Трыков on 2019-02-10.
// Copyright (c) 2019 trykov. All rights reserved.
//

import IGListKit

class ResearchCellViewModel {

    let id, name, image: String
    let summary: ResearchSummary?

    init(id: String, name: String, image: String?, summary: ResearchSummary?) {
        self.id = id
        self.name = name
        self.image = "https://roskachestvo.gov.ru" + (image ?? "")
        self.summary = summary
    }
}

extension ResearchCellViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ResearchCellViewModel else {
            return false
        }
        return object.name == self.name &&
                object.image == self.image &&
                object.summary == self.summary
    }

}

extension ResearchCellViewModel: ViewModel {

    var cellClass: UICollectionViewCell.Type {
        return ResearchCell.self
    }

    var defaultHeight: CGFloat? {
        return 176
    }

}
