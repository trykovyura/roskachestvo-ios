//
// Created by Юрий Трыков on 04.07.2020.
//

import Foundation
import Rswift

enum CategoryType: Int {
    case technics
    case technology
    case digital
    case drinks
    case food
    case clothing
    case shoes
    case house
    case beautyAndHealth
    case kids
    case unknown
}

extension CategoryType: Equatable {
    //swiftlint:disable cyclomatic_complexity
    init(rawValue: Int) {
        switch rawValue {
        case 358: self = .technics
        case 3: self = .technology
        case 30: self = .digital
        case 28: self = .drinks
        case 8: self = .food
        case 7: self = .clothing
        case 6: self = .shoes
        case 5: self = .house
        case 9: self = .beautyAndHealth
        case 606: self = .kids
        default: self = .unknown
        }
    }

    var image: ImageResource {
        switch self {
        case .technics:
            return R.image.technics // https://www.pexels.com/ru-ru/photo/3637728/
        case .technology:
            return R.image.technology // https://www.pexels.com/ru-ru/photo/apple-imac-ipad-mac-39284/
        case .drinks:
            return R.image.drinks // https://www.pexels.com/ru-ru/photo/544961/
        case .food:
            return R.image.food // https://www.pexels.com/ru-ru/photo/3756523/
        case .clothing:
            return R.image.clothes // https://www.pexels.com/ru-ru/photo/1078958/
        case .shoes:
            return R.image.shoes // https://www.pexels.com/ru-ru/photo/609771/
        case .house:
            return R.image.house // https://www.pexels.com/ru-ru/photo/3626588/
        case .digital:
            // https://www.pexels.com/ru-ru/photo/facebook-linkedin-world-wide-web-youtube-267350/
            return R.image.digital
        case .beautyAndHealth:
            return R.image.health // https://www.pexels.com/ru-ru/photo/3188/
        case .kids:
            return R.image.kids
        case .unknown:
            return R.image.octocat
        }
    }
}
