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

    func openResearchDetails(with id: String) {
        let segueId: String = R.segue.mainFeedViewController.openResearchDetailsSegue.identifier
        transitionHandler!.openModule?(usingSegue: segueId).thenChain {
            (moduleInput) -> RamblerViperModuleOutput? in

            guard let moduleInput = moduleInput as? ResearchDetailsModuleInput else {
                fatalError("Invalid module type \(ResearchDetailsModuleInput.self)")
            }
            moduleInput.configure(with: id)
            return nil
        }
    }
}
