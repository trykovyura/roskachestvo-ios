//
//  ResearchDetailsResearchDetailsDataDisplayManager.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

protocol ResearchDetailsDataDisplayManagerOutput: class {

}

class ResearchDetailsDataDisplayManager: NSObject {

     var viewModels = [ListDiffable]()

     weak var delegate: ResearchDetailsDataDisplayManagerOutput?

     func configure() {
         viewModels.removeAll()
         let viewModel = ResearchDetailsCellViewModel(id: "id", name: "name")
         viewModels.append(ResearchDetailsSectionViewModel(viewModel: viewModel))
     }
}

extension ResearchDetailsDataDisplayManager: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return viewModels
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is ResearchDetailsSectionViewModel:
            return ResearchDetailsSectionController()
        default:
            fatalError()
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}
