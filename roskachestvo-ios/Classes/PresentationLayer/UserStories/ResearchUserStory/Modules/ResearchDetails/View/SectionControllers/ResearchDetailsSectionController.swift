//
//  ResearchDetailsResearchDetailsSectionController.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

class ResearchDetailsSectionController: ListBindingSectionController<ResearchDetailsSectionViewModel>,
                                                       ListBindingSectionControllerDataSource {

    override init() {
        super.init()
        dataSource = self
        inset = UIEdgeInsets(top: 10, left: 4, bottom: 10, right: 4)
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                           viewModelsFor object: Any) -> [ListDiffable] {
        var viewModels = [ListDiffable]()
        guard let object = object as? ResearchDetailsSectionViewModel else {
            return viewModels
        }
        viewModels.append(object.viewModel)
        viewModels.append(contentsOf: object.products)
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
        case let vm as ResearchDetailsCellViewModel:
            height = vm.name.textHeight(width: width, customFont: R.font.backpackBold(size: 15)!)
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
