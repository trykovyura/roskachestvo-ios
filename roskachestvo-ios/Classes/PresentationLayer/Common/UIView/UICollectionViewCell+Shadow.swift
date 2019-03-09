//
// Created by Юрий Трыков on 2019-03-09.
// Copyright (c) 2019 trykov. All rights reserved.
//

import UIKit

extension UICollectionViewCell {

    func addShadow() {
        layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset.height = 3
        layer.shadowRadius = 3
        layer.masksToBounds = false
    }
}
