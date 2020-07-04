//
// Created by Юрий Трыков on 04.07.2020.
//

import Foundation
import Rswift

enum CategoryType: Int {
    case technics
    case technology
    case drinks
    case food
    case clothing
    case shoes
    case house
    case unknown
}

extension CategoryType: Equatable {
    init(rawValue: Int) {
        switch rawValue {
        case 358: self = .technics
        case 359: self = .technology
        case 311: self = .drinks
        case 9: self = .food
        case 74: self = .clothing
        case 291: self = .shoes
        case 11: self = .house
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
        case .unknown:
            return R.image.octocat
        }
    }
}
