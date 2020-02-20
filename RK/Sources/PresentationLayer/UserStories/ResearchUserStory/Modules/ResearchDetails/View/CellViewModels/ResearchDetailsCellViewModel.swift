//
//  ResearchDetailsResearchDetailsCellViewModel.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

class ResearchDetailsCellViewModel {

    let id, name: String

    init(id: String, name: String) {
       self.id = id
       self.name = name
    }
}

extension ResearchDetailsCellViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ResearchDetailsCellViewModel else {
            return false
        }
        return object.name == self.name
    }

}

extension ResearchDetailsCellViewModel: ViewModel {

    var cellClass: UICollectionViewCell.Type {
        return ResearchDetailsCell.self
    }

    var defaultHeight: CGFloat? {
        return 32
    }

}
