//
//  ProductDetailsProductDetailsDataDisplayManager.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

protocol ProductDetailsDataDisplayManagerOutput: class {

}

class ProductDetailsDataDisplayManager: NSObject {

     var viewModels = [ListDiffable]()

     weak var delegate: ProductDetailsDataDisplayManagerOutput?

     func configure(product: ProductDTO) {
         viewModels.removeAll()
         let viewModel = ProductDetailsCellViewModel(id: "id", name: product.name ?? "")
         viewModels.append(ProductDetailsSectionViewModel(viewModel: viewModel))
     }
}

extension ProductDetailsDataDisplayManager: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return viewModels
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is ProductDetailsSectionViewModel:
            return ProductDetailsSectionController()
        default:
            fatalError()
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}
