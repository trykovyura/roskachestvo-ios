//
//  ResearchDetailsResearchDetailsDataDisplayManager.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

protocol ResearchDetailsDataDisplayManagerOutput: ResearchDetailsSectionControllerOutput {

}

class ResearchDetailsDataDisplayManager: NSObject {

     var viewModels = [ListDiffable]()

     weak var delegate: ResearchDetailsDataDisplayManagerOutput?

     func configure(research: ResearchDTO) {
         viewModels.removeAll()
         let viewModel = ResearchDetailsCellViewModel(id: "id", name: research.anons ?? "")
         let products = research.products?.map { product in
             ProductCellViewModel(id: product.id ?? "",
                     name: product.name ?? "",
                     image: product.image?.src ?? "")
         }
         viewModels.append(ResearchDetailsSectionViewModel(viewModel: viewModel, products: products ?? []))
     }
}

extension ResearchDetailsDataDisplayManager: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return viewModels
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is ResearchDetailsSectionViewModel:
            return ResearchDetailsSectionController(output: delegate)
        default:
            fatalError()
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}
