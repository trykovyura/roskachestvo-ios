//
// Created by Юрий Трыков on 2019-01-30.
// Copyright (c) 2019 trykov. All rights reserved.
//

import UIKit

// Не использовать палитру напрямую в UI компонентах
//swiftlint:disable nesting
extension UIColor {
    enum ApplicationPalete {

        static var black: UIColor {
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }

        static var white: UIColor {
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }

        enum Gray {
            static var athens: UIColor {
                return #colorLiteral(red: 0.9647058824, green: 0.968627451, blue: 0.9764705882, alpha: 1) // athens F6F7F9
            }
            static var athens2: UIColor {
                return #colorLiteral(red: 0.9019607843, green: 0.9098039216, blue: 0.9215686275, alpha: 1) //athens2 E6E8EB
            }
            static var athensGray: UIColor {
                return #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9843137255, alpha: 1) //athensGray FAFAFB
            }
            static var ghost: UIColor {
                return #colorLiteral(red: 0.7843137255, green: 0.8, blue: 0.8274509804, alpha: 1) //ghost C8CCD3
            }
            static var paleSky: UIColor {
                return #colorLiteral(red: 0.4196078431, green: 0.4392156863, blue: 0.4862745098, alpha: 1) //Pale Sky 6B707C
            }
            static var silverChalice: UIColor {
                return #colorLiteral(red: 0.6235294118, green: 0.6235294118, blue: 0.6235294118, alpha: 1) //silverChalice 9F9F9F
            }
            static var doveGray: UIColor {
                return #colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 1) //Dove Gray 6F6F6F
            }
            static var scorpion: UIColor {
                return #colorLiteral(red: 0.3529411765, green: 0.3529411765, blue: 0.3529411765, alpha: 1) //Scorpion 5A5A5A
            }
        }

        enum Green {
            static var oxley: UIColor {
                return #colorLiteral(red: 0.4196078431, green: 0.5960784314, blue: 0.5058823529, alpha: 1) //oxley 6B9881
            }

        }

        enum Red {
            static var terracotta: UIColor {
                return #colorLiteral(red: 0.8941176471, green: 0.4274509804, blue: 0.3568627451, alpha: 1) //terracotta E46D5B
            }
        }

        enum Blue {

        }

        enum Yellow {
            static var buttercup: UIColor {
                return #colorLiteral(red: 0.937254902, green: 0.7607843137, blue: 0.07843137255, alpha: 1) //terracotta EFC214
            }
        }

    }
}
