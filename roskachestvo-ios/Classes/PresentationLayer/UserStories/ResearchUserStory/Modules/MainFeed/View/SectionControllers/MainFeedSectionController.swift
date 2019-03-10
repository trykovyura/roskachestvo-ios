//
//  MainFeedMainFeedSectionController.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

protocol MainFeedSectionControllerOutput: class {
    func didSelectResearch(with id: String)
    func didSelectCategory(with id: String)
}

class MainFeedSectionController: ListBindingSectionController<MainFeedSectionViewModel>,
        ListBindingSectionControllerDataSource {

    weak var output: MainFeedSectionControllerOutput?

    init(output: MainFeedSectionControllerOutput?) {
        super.init()
        self.output = output
        dataSource = self
        selectionDelegate = self
        inset = UIEdgeInsets(top: 10, left: 4, bottom: 10, right: 4)
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                           viewModelsFor object: Any) -> [ListDiffable] {
        var viewModels = [ListDiffable]()
        guard let object = object as? MainFeedSectionViewModel else {
            return viewModels
        }
        if let viewModel = object.viewModel {
            viewModels.append(viewModel)
        }
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

extension MainFeedSectionController: ListBindingSectionControllerSelectionDelegate {

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                           didSelectItemAt index: Int, viewModel: Any) {
        switch viewModel {
        case let viewModel as ResearchCellViewModel:
            output?.didSelectResearch(with: viewModel.id)
        case let viewModel as MainFeedCellViewModel:
            output?.didSelectCategory(with: viewModel.id)
        default:
            ()
        }
    }
}
