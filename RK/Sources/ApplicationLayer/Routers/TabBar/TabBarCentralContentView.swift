//
// Created by Юрий Трыков on 2019-01-30.
// Copyright (c) 2019 trykov. All rights reserved.
//

import ESTabBarController_swift

class TabBarCentralContentView: TabBarBasicContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        renderingMode = .alwaysOriginal
        self.insets = UIEdgeInsets.init(top: -32, left: 0, bottom: 0, right: 0)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateLayout() {
        super.updateLayout()
        self.imageView.sizeToFit()
        self.imageView.center = CGPoint.init(x: self.bounds.size.width / 2.0, y: self.bounds.size.height / 2.0)
    }
}
