//
// Created by Юрий Трыков on 2019-02-17.
// Copyright (c) 2019 trykov. All rights reserved.
//

import IGListKit

class ProductCellViewModel {

    let id, name, image: String

    init(id: String, name: String, image: String?) {
        self.id = id
        self.name = name
        self.image = Constants.imagePrefix + (image ?? "")
    }
}

extension ProductCellViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ProductCellViewModel else {
            return false
        }
        return object.name == self.name &&
                object.image == self.image
    }

}

extension ProductCellViewModel: ViewModel {

    var cellClass: UICollectionViewCell.Type {
        return ProductCell.self
    }

    var defaultHeight: CGFloat? {
        return 136
    }

}
