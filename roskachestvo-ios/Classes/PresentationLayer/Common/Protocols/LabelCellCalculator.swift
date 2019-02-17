//
// Created by Юрий Трыков on 2019-02-17.
// Copyright (c) 2019 trykov. All rights reserved.
//

import UIKit

protocol LabelCellCalculator {
    static var insets: UIEdgeInsets { get }
    static var font: UIFont { get }
    static func textHeight(_ text: String, width: CGFloat, customFont: UIFont) -> CGFloat
    static func textHeight(_ attributedText: NSAttributedString, width: CGFloat) -> CGFloat
}

extension LabelCellCalculator {

    static var insets: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    static var font: UIFont {
        return UIFont.systemFont(ofSize: 20)
    }

    static func textHeight(_ text: String, width: CGFloat, customFont: UIFont = Self.font) -> CGFloat {
        return text.textHeight(width: width, customFont: customFont)
    }

    static func textHeight(_ attributedText: NSAttributedString, width: CGFloat) -> CGFloat {
        let constrainedSize = CGSize(width: width - insets.left - insets.right, height: CGFloat.greatestFiniteMagnitude)
        let bounds = attributedText.boundingRect(with: constrainedSize,
                options: [.usesFontLeading, .usesLineFragmentOrigin],
                context: nil)
        return ceil(bounds.height) + insets.top + insets.bottom
    }

}

extension String {
    func textHeight(width: CGFloat, customFont: UIFont) -> CGFloat {
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let constrainedSize = CGSize(width: width - insets.left - insets.right, height: CGFloat.greatestFiniteMagnitude)
        let attributes = [NSAttributedString.Key.font: customFont]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        let bounds = (self as NSString).boundingRect(with: constrainedSize, options: options,
                attributes: attributes, context: nil)
        return ceil(bounds.height) + insets.top + insets.bottom
    }
}
