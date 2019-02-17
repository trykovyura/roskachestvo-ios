//
//  ResearchDetailsResearchDetailsPresenter.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import Foundation
import ViperMcFlurry

class ResearchDetailsPresenter: NSObject, ResearchDetailsModuleInput {

    weak var view: ResearchDetailsViewInput?
    var interactor: ResearchDetailsInteractorInput
    var router: ResearchDetailsRouterInput
    weak var moduleOutput: ResearchDetailsModuleOutput?

    init(view: ResearchDetailsViewInput, interactor: ResearchDetailsInteractorInput,
         router: ResearchDetailsRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func configure(with researchId: String) {

    }
}

extension ResearchDetailsPresenter: ResearchDetailsViewOutput {

    func didTriggerViewReady() {
        view?.setupInitialState()
    }

}

extension ResearchDetailsPresenter: ResearchDetailsInteractorOutput {

}

extension ResearchDetailsPresenter {

    func setModuleOutput(_ moduleOutput: RamblerViperModuleOutput!) {
        self.moduleOutput = moduleOutput as? ResearchDetailsModuleOutput
    }

}
