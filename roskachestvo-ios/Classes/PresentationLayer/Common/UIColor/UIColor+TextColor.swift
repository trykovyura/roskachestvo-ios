//
// Created by Юрий Трыков on 2019-01-30.
// Copyright (c) 2019 trykov. All rights reserved.
//

import UIKit

//swiftlint:disable nesting
extension UIColor {

    enum Background {

        static var grey: UIColor {
            return UIColor.ApplicationPalete.Gray.athens
        }

    }

    enum TextColor {
        static var black: UIColor {
            return UIColor.ApplicationPalete.black
        }

        static var white: UIColor {
            return UIColor.ApplicationPalete.white
        }

        enum Gray {
            static var athens: UIColor {
                return UIColor.ApplicationPalete.Gray.athens
            }
            static var athens2: UIColor {
                return UIColor.ApplicationPalete.Gray.athens2
            }
            static var athensGray: UIColor {
                return UIColor.ApplicationPalete.Gray.athensGray
            }
            static var doveGray: UIColor {
                return UIColor.ApplicationPalete.Gray.doveGray
            }
            static var ghost: UIColor {
                return UIColor.ApplicationPalete.Gray.ghost
            }
            static var paleSky: UIColor {
                return UIColor.ApplicationPalete.Gray.paleSky
            }
            static var silverChalice: UIColor {
                return UIColor.ApplicationPalete.Gray.silverChalice
            }
            static var scorpion: UIColor {
                return UIColor.ApplicationPalete.Gray.scorpion
            }
            static var gallery: UIColor {
                return UIColor.ApplicationPalete.Gray.gallery
            }
        }

        enum Green {
            static var oxley: UIColor {
                return UIColor.ApplicationPalete.Green.oxley
            }
        }

        enum Red {
            static let terracotta = UIColor.ApplicationPalete.Red.terracotta
        }

        enum Blue {

        }

        enum Yellow {
            static let buttercup = UIColor.ApplicationPalete.Yellow.buttercup
        }
    }
}
