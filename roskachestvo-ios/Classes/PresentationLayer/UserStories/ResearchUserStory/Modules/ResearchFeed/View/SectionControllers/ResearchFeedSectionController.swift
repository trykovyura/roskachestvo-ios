//
//  ResearchFeedResearchFeedSectionController.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

protocol ResearchFeedSectionControllerOutput: class {
    func didSelectResearch(with id: String)
}

class ResearchFeedSectionController: ListBindingSectionController<ResearchFeedSectionViewModel>,
                                                       ListBindingSectionControllerDataSource {

    weak var output: ResearchFeedSectionControllerOutput?

    init(output: ResearchFeedSectionControllerOutput?) {
        super.init()
        self.output = output
        selectionDelegate = self
        dataSource = self
        inset = UIEdgeInsets(top: 10, left: 4, bottom: 10, right: 4)
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                           viewModelsFor object: Any) -> [ListDiffable] {
        var viewModels = [ListDiffable]()
        guard let object = object as? ResearchFeedSectionViewModel else {
            return viewModels
        }
        viewModels.append(object.viewModel)
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

extension ResearchFeedSectionController: ListBindingSectionControllerSelectionDelegate {

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                           didSelectItemAt index: Int, viewModel: Any) {
        switch viewModel {
        case let viewModel as ResearchCellViewModel:
            output?.didSelectResearch(with: viewModel.id)
        default:
            ()
        }
    }
}
