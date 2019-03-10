//
// Created by Юрий Трыков on 2019-03-10.
// Copyright (c) 2019 trykov. All rights reserved.
//

import IGListKit

class SkeletonSectionViewModel: NSObject {

    let viewModels: [ListDiffable]

    init(viewModels: [ListDiffable]) {
        self.viewModels = viewModels
    }

    static func feedSkeletonViewModels(height: CGFloat = 136) -> [ListDiffable] {
        var viewModels: [ListDiffable] = []
        viewModels.append(SkeletonCellViewModel(height: height))
        viewModels.append(SkeletonCellViewModel(height: height))
        viewModels.append(SkeletonCellViewModel(height: height))
        viewModels.append(SkeletonCellViewModel(height: height))
        return viewModels
    }

}

extension SkeletonSectionViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return self
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}
