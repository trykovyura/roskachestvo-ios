//
//  ResearchDetailsResearchDetailsRouter.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import ViperMcFlurry

class ResearchDetailsRouter: ResearchDetailsRouterInput {

    weak var transitionHandler: RamblerViperModuleTransitionHandlerProtocol?

    init(transitionHandler: RamblerViperModuleTransitionHandlerProtocol) {
        self.transitionHandler = transitionHandler
    }
}