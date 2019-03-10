//
// Created by Юрий Трыков on 2019-03-10.
// Copyright (c) 2019 trykov. All rights reserved.
//

import IGListKit

class SkeletonCellViewModel: NSObject {

    let id: String
    let height: CGFloat

    init(id: String = UUID().uuidString, height: CGFloat = 16) {
        self.id = id
        self.height = height
    }
}

extension SkeletonCellViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard object is SkeletonCellViewModel else {
            return false
        }
        return height == height
    }

}

extension SkeletonCellViewModel: ViewModel {

    var cellClass: UICollectionViewCell.Type {
        return SkeletonCell.self
    }

    var defaultHeight: CGFloat? {
        return height
    }

    func size(for width: CGFloat) -> CGSize {
        guard let defaultHeight = defaultHeight else {
            return .zero
        }
        return CGSize(width: width, height: defaultHeight)
    }
}
