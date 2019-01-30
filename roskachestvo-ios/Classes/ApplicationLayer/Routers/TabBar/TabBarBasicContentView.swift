//
// Created by Юрий Трыков on 2019-01-30.
// Copyright (c) 2019 trykov. All rights reserved.
//

import ESTabBarController_swift

class TabBarBasicContentView: ESTabBarItemContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor.TextColor.Gray.scorpion
        highlightTextColor = UIColor.TextColor.Green.oxley
        iconColor = UIColor.TextColor.Gray.paleSky
        highlightIconColor = UIColor.TextColor.Green.oxley
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func updateLayout() {
        super.updateLayout()
        titleLabel.font = UIFont.FontPreset.subheadline
        titleLabel.sizeToFit()
    }
}
