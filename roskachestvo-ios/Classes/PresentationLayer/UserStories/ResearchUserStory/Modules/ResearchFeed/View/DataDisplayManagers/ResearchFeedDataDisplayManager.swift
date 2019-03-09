//
//  ResearchFeedResearchFeedDataDisplayManager.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

protocol ResearchFeedDataDisplayManagerOutput: MainFeedSectionControllerOutput {

}

class ResearchFeedDataDisplayManager: NSObject {

     var viewModels = [ListDiffable]()

     weak var delegate: ResearchFeedDataDisplayManagerOutput?

     func configure(researches: [ResearchesPlainObject]) {
         viewModels.removeAll()
         let researches = researches.map { research in
             ResearchCellViewModel(id: research.id, name: research.name, image: research.image.src)
         }
         viewModels.append(MainFeedSectionViewModel(viewModel: nil, researches: researches))
     }
}

extension ResearchFeedDataDisplayManager: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return viewModels
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is ResearchFeedSectionViewModel:
            return ResearchFeedSectionController()
        case is MainFeedSectionViewModel:
            return MainFeedSectionController(output: delegate)
        default:
            fatalError()
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}
