//
// Created by Юрий Трыков on 2019-03-10.
// Copyright (c) 2019 trykov. All rights reserved.
//

import IGListKit
import SkeletonView

class SkeletonCell: UICollectionViewCell, ListBindable {

    // MARK: ListBindable

    func bindViewModel(_ viewModel: Any) {
        guard viewModel is SkeletonCellViewModel else {
            return
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        isSkeletonable = true
        contentView.backgroundColor = .white
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        hideSkeleton()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
