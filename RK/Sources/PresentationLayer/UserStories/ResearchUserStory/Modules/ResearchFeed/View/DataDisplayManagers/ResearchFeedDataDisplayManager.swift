//
//  ResearchFeedResearchFeedDataDisplayManager.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

protocol ResearchFeedDataDisplayManagerOutput: ResearchFeedSectionControllerOutput {

}

class ResearchFeedDataDisplayManager: NSObject {

    var viewModels: [ListDiffable] = [SkeletonSectionViewModel(viewModels:
    SkeletonSectionViewModel.feedSkeletonViewModels(height: 176))]

     weak var delegate: ResearchFeedDataDisplayManagerOutput?

     func configure(researches: [ResearchesDTO]) {
         viewModels.removeAll()
//         let researches: [ResearchFeedSectionViewModel] = researches.map { research in
//             let viewModel = ResearchCellViewModel(id: research.id ?? "",
//                     name: research.name ?? "",
//                     image: research.image?.src ?? "",
//                     summary: research.summary)
//             return ResearchFeedSectionViewModel(viewModel: viewModel)
//         }
//         viewModels.append(contentsOf: researches)
     }
}

extension ResearchFeedDataDisplayManager: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return viewModels
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is ResearchFeedSectionViewModel:
            return ResearchFeedSectionController(output: delegate)
        case is SkeletonSectionViewModel:
            return SkeletonSectionController()
        default:
            fatalError()
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}
