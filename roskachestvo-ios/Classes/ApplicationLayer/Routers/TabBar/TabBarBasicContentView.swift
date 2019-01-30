//
// Created by Юрий Трыков on 2019-01-30.
// Copyright (c) 2019 trykov. All rights reserved.
//

import ESTabBarController_swift

class TabBarBasicContentView: ESTabBarItemContentView {

    let tabBarFont = UIFont.FontPreset.subheadline

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

    // Это пришлось сделать из за шрифта - кожанные ублюдки не позаботились
    override func updateLayout() {
        let w = self.bounds.size.width
        let h = self.bounds.size.height

        imageView.isHidden = (imageView.image == nil)
        titleLabel.isHidden = (titleLabel.text == nil)

        if self.itemContentMode == .alwaysTemplate {
            var s: CGFloat = 0.0 // image size
            var isLandscape = false
            if let keyWindow = UIApplication.shared.keyWindow {
                isLandscape = keyWindow.bounds.width > keyWindow.bounds.height
            }
            let isWide = isLandscape || traitCollection.horizontalSizeClass == .regular // is landscape or regular
            if #available(iOS 11.0, *), isWide {
                s = UIScreen.main.scale == 3.0 ? 23.0 : 20.0
            } else {
                s = 23.0
            }

            if !imageView.isHidden && !titleLabel.isHidden {
                titleLabel.font = tabBarFont
                titleLabel.sizeToFit()
                if #available(iOS 11.0, *), isWide {
                    titleLabel.frame = CGRect.init(x: (w - titleLabel.bounds.size.width) / 2.0 + (UIScreen.main.scale == 3.0 ? 14.25 : 12.25),
                            y: (h - titleLabel.bounds.size.height) / 2.0,
                            width: titleLabel.bounds.size.width,
                            height: titleLabel.bounds.size.height)
                    imageView.frame = CGRect.init(x: titleLabel.frame.origin.x - s - (UIScreen.main.scale == 3.0 ? 6.0 : 5.0),
                            y: (h - s) / 2.0,
                            width: s,
                            height: s)
                } else {
                    titleLabel.frame = CGRect.init(x: (w - titleLabel.bounds.size.width) / 2.0,
                            y: h - titleLabel.bounds.size.height - 1.0,
                            width: titleLabel.bounds.size.width,
                            height: titleLabel.bounds.size.height)
                    imageView.frame = CGRect.init(x: (w - s) / 2.0,
                            y: (h - s) / 2.0 - 6.0,
                            width: s,
                            height: s)
                }
            } else if !imageView.isHidden {
                imageView.frame = CGRect.init(x: (w - s) / 2.0,
                        y: (h - s) / 2.0,
                        width: s,
                        height: s)
            } else if !titleLabel.isHidden {
                titleLabel.font = tabBarFont
                titleLabel.sizeToFit()
                titleLabel.frame = CGRect.init(x: (w - titleLabel.bounds.size.width) / 2.0,
                        y: (h - titleLabel.bounds.size.height) / 2.0,
                        width: titleLabel.bounds.size.width,
                        height: titleLabel.bounds.size.height)
            }

            if let _ = badgeView.superview {
                let size = badgeView.sizeThatFits(self.frame.size)
                if #available(iOS 11.0, *), isWide {
                    badgeView.frame = CGRect.init(origin: CGPoint.init(x: imageView.frame.midX - 3 + badgeOffset.horizontal, y: imageView.frame.midY + 3 + badgeOffset.vertical), size: size)
                } else {
                    badgeView.frame = CGRect.init(origin: CGPoint.init(x: w / 2.0 + badgeOffset.horizontal, y: h / 2.0 + badgeOffset.vertical), size: size)
                }
                badgeView.setNeedsLayout()
            }

        } else {
            if !imageView.isHidden && !titleLabel.isHidden {
                titleLabel.sizeToFit()
                imageView.sizeToFit()
                titleLabel.frame = CGRect.init(x: (w - titleLabel.bounds.size.width) / 2.0,
                        y: h - titleLabel.bounds.size.height - 1.0,
                        width: titleLabel.bounds.size.width,
                        height: titleLabel.bounds.size.height)
                imageView.frame = CGRect.init(x: (w - imageView.bounds.size.width) / 2.0,
                        y: (h - imageView.bounds.size.height) / 2.0 - 6.0,
                        width: imageView.bounds.size.width,
                        height: imageView.bounds.size.height)
            } else if !imageView.isHidden {
                imageView.sizeToFit()
                imageView.center = CGPoint.init(x: w / 2.0, y: h / 2.0)
            } else if !titleLabel.isHidden {
                titleLabel.sizeToFit()
                titleLabel.center = CGPoint.init(x: w / 2.0, y: h / 2.0)
            }

            if let _ = badgeView.superview {
                let size = badgeView.sizeThatFits(self.frame.size)
                badgeView.frame = CGRect.init(origin: CGPoint.init(x: w / 2.0 + badgeOffset.horizontal, y: h / 2.0 + badgeOffset.vertical), size: size)
                badgeView.setNeedsLayout()
            }
        }
    }
}
