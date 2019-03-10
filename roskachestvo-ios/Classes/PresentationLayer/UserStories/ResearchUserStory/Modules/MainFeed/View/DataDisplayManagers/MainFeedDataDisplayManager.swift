//
//  MainFeedMainFeedDataDisplayManager.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

protocol MainFeedDataDisplayManagerOutput: MainFeedSectionControllerOutput {

}

class MainFeedDataDisplayManager: NSObject {

    var viewModels: [ListDiffable] = [SkeletonSectionViewModel(viewModels:
    SkeletonSectionViewModel.feedSkeletonViewModels())]

    weak var delegate: MainFeedDataDisplayManagerOutput?

    func configure(categories: [CategoriesPlainObject]) {
        viewModels.removeAll()
        viewModels.append(contentsOf: categories.map { category in
            let viewModel = MainFeedCellViewModel(id: String(category.id), name: category.name,
                    image: category.researches.first?.image.src)
            let researches = category.researches.map { research in
                ResearchCellViewModel(id: research.id,
                        name: research.name,
                        image: research.image.src,
                        summary: research.summary)
            }
            return MainFeedSectionViewModel(viewModel: viewModel, researches: [])
        })
    }
}

extension MainFeedDataDisplayManager: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return viewModels
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is MainFeedSectionViewModel:
            return MainFeedSectionController(output: delegate)
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
