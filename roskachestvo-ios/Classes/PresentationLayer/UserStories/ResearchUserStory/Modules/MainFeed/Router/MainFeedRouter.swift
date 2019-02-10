//
//  MainFeedMainFeedRouter.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import ViperMcFlurry

class MainFeedRouter: MainFeedRouterInput {

    weak var transitionHandler: RamblerViperModuleTransitionHandlerProtocol?

    init(transitionHandler: RamblerViperModuleTransitionHandlerProtocol) {
        self.transitionHandler = transitionHandler
    }
}
