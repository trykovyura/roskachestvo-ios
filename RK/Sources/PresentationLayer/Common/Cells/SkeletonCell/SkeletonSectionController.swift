//
// Created by Юрий Трыков on 2019-03-10.
// Copyright (c) 2019 trykov. All rights reserved.
//

import IGListKit
import SkeletonView

class SkeletonSectionController: ListBindingSectionController<ListDiffable>,
        ListBindingSectionControllerDataSource {

    override init() {
        super.init()
        dataSource = self
        inset = UIEdgeInsets(top: 10, left: 4, bottom: 10, right: 4)
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                           viewModelsFor object: Any) -> [ListDiffable] {
        var viewModels = [ListDiffable]()
        guard let object = object as? SkeletonSectionViewModel else {
            return viewModels
        }
        viewModels.append(contentsOf: object.viewModels)
        return viewModels
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                           cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        guard let viewModel = viewModel as? ViewModel,
              let cell = collectionContext?.dequeueReusableCell(of: viewModel.cellClass,
                      for: self, at: index) as? UICollectionViewCell & ListBindable else {
            fatalError()
        }
        cell.showAnimatedGradientSkeletonLT()
        return cell
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>,
                           sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        guard let viewModel = viewModel as? ViewModel else {
            return .zero
        }
        let width = obtainSectionWidth()
        switch viewModel {
        case let viewModel as SkeletonCellViewModel:
            switch viewModel.id {
            case "1", "2", "3", "4":
                return viewModel.size(for: ceil(obtainCellWidth() / 5))
            case "5", "6", "7", "8", "9", "10", "11", "12":
                return viewModel.size(for: ceil(obtainCellWidth() / 2))
            default:
                return viewModel.size(for: width)
            }
        default:
            return viewModel.size(for: width)
        }
    }

}
