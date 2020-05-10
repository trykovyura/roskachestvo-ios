//
// Created by Юрий Трыков on 2019-03-09.
// Copyright (c) 2019 trykov. All rights reserved.
//

import UIKit
import SkeletonView

extension UICollectionViewCell {

    func addShadow() {
        layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset.height = 3
        layer.shadowRadius = 3
        layer.masksToBounds = false
    }

    func skeletonGradient() -> SkeletonGradient {
        let gradient = SkeletonGradient(baseColor: R.color.ghost1()!,
                secondaryColor: R.color.ghost2())
        return gradient
    }

    func showAnimatedGradientSkeletonLT() {
        showAnimatedGradientSkeleton(usingGradient: skeletonGradient(), animation: nil)
    }
}
