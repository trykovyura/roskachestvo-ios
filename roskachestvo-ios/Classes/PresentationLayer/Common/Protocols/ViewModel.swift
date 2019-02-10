//
// Created by Юрий Трыков on 2019-02-10.
// Copyright (c) 2019 trykov. All rights reserved.
//

import IGListKit

protocol ViewModel {

    var modelIdentifier: String { get }
    var cellClass: UICollectionViewCell.Type { get }
    var reuseIdentifier: String { get }
    var estimatedHeight: CGFloat? { get }
    var defaultHeight: CGFloat? { get }
    func size(for width: CGFloat) -> CGSize

}

extension ViewModel {

    var modelIdentifier: String {
        return ""
    }

    var reuseIdentifier: String {
        return String(describing: cellClass)
    }

    var estimatedHeight: CGFloat? {
        return nil
    }

    var defaultHeight: CGFloat? {
        return nil
    }

    func size(for width: CGFloat) -> CGSize {
        return .zero
    }

}

extension ListSectionController {

    /**
     * Получение ширины для секции с учетом inset
     * --------
     */
    func obtainSectionWidth(insetsIncluded: Bool = true) -> CGFloat {
        guard var width = collectionContext?.insetContainerSize.width else {
            fatalError()
        }
        width += insetsIncluded ? -(inset.left + inset.right) : 0
        return width
    }

    /**
     * Получение ширины для ячейки с учетом inset и межяичечном расстоянии
     * ----|----
     */
    func obtainCellWidth() -> CGFloat {
        var width = obtainSectionWidth()
        width += -minimumInteritemSpacing
        return width
    }

    /**
    * Получение высоты для секции с учетом inset
    * --------
    */
    func obtainSectionHeight() -> CGFloat {
        guard var height = collectionContext?.insetContainerSize.height else {
            fatalError()
        }
        height += -(inset.top + inset.bottom)
        return height
    }
}
