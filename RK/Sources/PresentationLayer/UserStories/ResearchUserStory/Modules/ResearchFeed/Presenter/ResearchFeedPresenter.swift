//
//  ResearchFeedResearchFeedPresenter.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import Foundation
import ViperMcFlurry

class ResearchFeedPresenter: NSObject, ResearchFeedModuleInput {

    weak var view: ResearchFeedViewInput?
    var interactor: ResearchFeedInteractorInput
    var router: ResearchFeedRouterInput
    weak var moduleOutput: ResearchFeedModuleOutput?

    var categoryId: String?

    init(view: ResearchFeedViewInput, interactor: ResearchFeedInteractorInput, router: ResearchFeedRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func configure(with categoryId: String?) {
        self.categoryId = categoryId
    }
}

extension ResearchFeedPresenter: ResearchFeedViewOutput {

    func didTriggerViewReady() {
        view?.setupInitialState()
        interactor.researches(with: categoryId)
    }

    func didTriggerResearch(with id: String) {
        router.openResearchDetails(with: id)
    }
}

extension ResearchFeedPresenter: ResearchFeedInteractorOutput {

    func didObtainResearches(_ researches: [ResearchesDTO]) {
        view?.configureWith(researches: researches)
    }

    func didFailObtainResearches() {

    }
}

extension ResearchFeedPresenter {

    func setModuleOutput(_ moduleOutput: RamblerViperModuleOutput!) {
        self.moduleOutput = moduleOutput as? ResearchFeedModuleOutput
    }

}
