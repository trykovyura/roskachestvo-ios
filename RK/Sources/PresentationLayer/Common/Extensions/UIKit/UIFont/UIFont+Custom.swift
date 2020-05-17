//
// Created by Юрий Трыков on 2019-01-30.
// Copyright (c) 2019 trykov. All rights reserved.
//

import UIKit

enum FontBook: String {
    case proximaNovaBold = "ProximaNova-Bold"
    case proximaNovaRegular = "ProximaNova"
}

extension UIFont {

    enum FontPreset {
        static var title1: UIFont {
            return UIFont(name: FontBook.proximaNovaBold.rawValue, size: 22) ?? UIFont.systemFont(ofSize: 22)
        }
        static var title2: UIFont {
            return UIFont(name: FontBook.proximaNovaBold.rawValue, size: 20) ?? UIFont.systemFont(ofSize: 20)
        }
        static var title18: UIFont {
            return UIFont(name: FontBook.proximaNovaBold.rawValue, size: 18) ?? UIFont.systemFont(ofSize: 18)
        }
        static var title3: UIFont {
            return UIFont(name: FontBook.proximaNovaBold.rawValue, size: 17) ?? UIFont.systemFont(ofSize: 17)
        }
        static var headline: UIFont {
            return UIFont(name: FontBook.proximaNovaBold.rawValue, size: 15) ?? UIFont.systemFont(ofSize: 15)
        }
        static var subheadline: UIFont {
            return UIFont(name: FontBook.proximaNovaBold.rawValue, size: 11) ?? UIFont.systemFont(ofSize: 12)
        }
        static var body: UIFont {
            return UIFont(name: FontBook.proximaNovaRegular.rawValue, size: 17) ?? UIFont.systemFont(ofSize: 17)
        }
        static var callout: UIFont {
            return UIFont(name: FontBook.proximaNovaRegular.rawValue, size: 15) ?? UIFont.systemFont(ofSize: 15)
        }
        static var footnote: UIFont {
            return UIFont(name: FontBook.proximaNovaRegular.rawValue, size: 12) ?? UIFont.systemFont(ofSize: 12)
        }
        static var caption1: UIFont {
            return UIFont(name: FontBook.proximaNovaRegular.rawValue, size: 10) ?? UIFont.systemFont(ofSize: 10)
        }

    }
}
