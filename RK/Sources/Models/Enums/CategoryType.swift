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
            return R.image.technics
        default:
            return R.image.octocat
        }
    }
}
