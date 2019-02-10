//
//  MainFeedMainFeedPresenter.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import Foundation
import ViperMcFlurry

class MainFeedPresenter: NSObject, MainFeedModuleInput {

    weak var view: MainFeedViewInput?
    var interactor: MainFeedInteractorInput
    var router: MainFeedRouterInput
    weak var moduleOutput: MainFeedModuleOutput?

    init(view: MainFeedViewInput, interactor: MainFeedInteractorInput, router: MainFeedRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension MainFeedPresenter: MainFeedViewOutput {

    func didTriggerViewReady() {
        view?.setupInitialState()
        interactor.categoriesWithResearches()
    }

}

extension MainFeedPresenter: MainFeedInteractorOutput {

    func didObtainCategoriesWithResearches(_ response: [CategoriesPlainObject]) {
        view?.configureWith(categories: response)
    }

    func didFailObtainCategoriesWithResearches() {

    }

}

extension MainFeedPresenter {

    func setModuleOutput(_ moduleOutput: RamblerViperModuleOutput!) {
        self.moduleOutput = moduleOutput as? MainFeedModuleOutput
    }

}
