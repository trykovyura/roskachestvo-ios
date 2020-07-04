//
//  MainFeedMainFeedCellViewModel.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

class MainFeedCellViewModel {

    let id, name, image: String

    init(id: String, name: String, image: String?) {
       self.id = id
       self.name = name
       self.image = "https://roskachestvo.gov.ru" + (image ?? "")
    }

    convenience init(model: CategoriesDTO) {
        self.init(id: model.id?.description ?? "", name: model.name ?? "",
                image: model.researches?.first?.image?.src)
    }
}

extension MainFeedCellViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? MainFeedCellViewModel else {
            return false
        }
        return object.name == self.name &&
                object.image == self.image
    }

}

extension MainFeedCellViewModel: ViewModel {

    var cellClass: UICollectionViewCell.Type {
        return MainFeedCell.self
    }

    var defaultHeight: CGFloat? {
        return 136
    }

}
