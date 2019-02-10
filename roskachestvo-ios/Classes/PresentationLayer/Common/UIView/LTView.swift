//
// Created by Юрий Трыков on 2019-02-10.
// Copyright (c) 2019 trykov. All rights reserved.
//

import UIKit

@IBDesignable
class LTView: UIView {

    // MARK: - Gradient

    @IBInspectable var firstColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }

    @IBInspectable var secondColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }

    @IBInspectable var horizontalGradient: Bool = false {
        didSet {
            updateView()
        }
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    func updateView() {
        guard let layer = self.layer as? CAGradientLayer else {
            return
        }
        layer.colors = [ firstColor.cgColor, secondColor.cgColor ]

        if horizontalGradient {
            layer.startPoint = CGPoint(x: 0.0, y: 0.5)
            layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
        }
    }

    // MARK: - Border

    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    // MARK: - Shadow

    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }

    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
}
