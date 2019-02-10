//
//  MainFeedMainFeedSectionController.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

class MainFeedSectionController: ListBindingSectionController<MainFeedSectionViewModel>,
                                                       ListBindingSectionControllerDataSource {

    override init() {
        super.init()
        dataSource = self
        inset = UIEdgeInsets(top: 15, left: 20, bottom: 0, right: 20)
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                           viewModelsFor object: Any) -> [ListDiffable] {
        var viewModels = [ListDiffable]()
        guard let object = object as? MainFeedSectionViewModel else {
            return viewModels
        }
        viewModels.append(object.viewModel)
        viewModels.append(contentsOf: object.researches)
        return viewModels
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                           cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        guard let viewModel = viewModel as? ViewModel else {
            fatalError()
        }
        guard let cell = collectionContext?.dequeueReusableCell(of: viewModel.cellClass,
                for: self, at: index) as? UICollectionViewCell & ListBindable else {
            fatalError()
        }
        return cell
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                           sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        let width = obtainSectionWidth()
        let height: CGFloat
        switch viewModel {
        default:
            if let viewModel = viewModel as? ViewModel, let cellHeight = viewModel.defaultHeight {
                height = cellHeight
            } else {
                height = 0
            }
        }
        return CGSize(width: width, height: height)
    }
}
