//
//  ResearchFeedResearchFeedConfigurator.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import UIKit

class ResearchFeedModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ResearchFeedViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ResearchFeedViewController) {
        let router = ResearchFeedRouter(transitionHandler: viewController)
        let researchNetworkService = MainAssembler.sharedInstance.resolve(ResearchNetworkServiceType.self)
        let interactor = ResearchFeedInteractor(researchNetworkService: researchNetworkService)
        let presenter = ResearchFeedPresenter(view: viewController, interactor: interactor, router: router)

        interactor.output = presenter

        viewController.output = presenter
        viewController.moduleInput = presenter
        let ddm = ResearchFeedDataDisplayManager()
        ddm.delegate = viewController
        viewController.dataDisplayManager = ddm
    }

}
