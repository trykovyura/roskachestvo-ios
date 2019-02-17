//
//  ProductDetailsProductDetailsSectionViewModel.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

class ProductDetailsSectionViewModel: NSObject {

    let viewModel: ProductDetailsCellViewModel

    init(viewModel: ProductDetailsCellViewModel) {
       self.viewModel = viewModel
    }
}

extension ProductDetailsSectionViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return self
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }

}
