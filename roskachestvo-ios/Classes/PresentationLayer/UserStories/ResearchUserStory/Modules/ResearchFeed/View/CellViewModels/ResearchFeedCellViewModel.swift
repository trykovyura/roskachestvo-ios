//
//  ResearchFeedResearchFeedCellViewModel.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

class ResearchFeedCellViewModel {

    let id, name: String

    init(id: String, name: String) {
       self.id = id
       self.name = name
    }
}

extension ResearchFeedCellViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ResearchFeedCellViewModel else {
            return false
        }
        return object.name == self.name
    }

}

extension ResearchFeedCellViewModel: ViewModel {

    var cellClass: UICollectionViewCell.Type {
        return ResearchFeedCell.self
    }

    var defaultHeight: CGFloat? {
        return 32
    }

}
