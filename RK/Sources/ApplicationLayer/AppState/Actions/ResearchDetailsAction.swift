//
// Created by Юрий Трыков on 18.07.2020.
//

import Foundation

extension Actions {
    enum ResearchFeedAction: Action {
        case start(researchId: String)
        case error(Error)
        case success(ResearchVO)
    }
}
