//
//  ProductDetailsProductDetailsCellViewModel.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

class ProductDetailsCellViewModel {

    let id, name: String

    init(id: String, name: String) {
       self.id = id
       self.name = name
    }
}

extension ProductDetailsCellViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? ProductDetailsCellViewModel else {
            return false
        }
        return object.name == self.name
    }

}

extension ProductDetailsCellViewModel: ViewModel {

    var cellClass: UICollectionViewCell.Type {
        return ProductDetailsCell.self
    }

    var defaultHeight: CGFloat? {
        return 32
    }

}
