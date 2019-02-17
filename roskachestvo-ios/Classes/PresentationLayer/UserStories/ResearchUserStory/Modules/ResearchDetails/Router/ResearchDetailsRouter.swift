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

    func openProductDetails(with id: String) {
        let segueId: String = R.segue.researchDetailsViewController.openProductDetailsSegue.identifier
        transitionHandler?.openModule!(usingSegue: segueId).thenChain { (moduleInput) -> RamblerViperModuleOutput? in

            guard let moduleInput = moduleInput as? ProductDetailsModuleInput else {
                fatalError("Invalid module type \(ProductDetailsModuleInput.self)")
            }
            moduleInput.configure(with: id)
            return nil
        }
    }
}
