//
//  MainFeedMainFeedConfigurator.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import UIKit

class MainFeedModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? MainFeedViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainFeedViewController) {
        let router = MainFeedRouter(transitionHandler: viewController)
        let researchNetworkService = MainAssembler.sharedInstance.resolve(ResearchNetworkServiceType.self)
        let interactor = MainFeedInteractor(researchNetworkService: researchNetworkService)
        let presenter = MainFeedPresenter(view: viewController, interactor: interactor, router: router)

        interactor.output = presenter

        viewController.output = presenter
        viewController.moduleInput = presenter
        let ddm = MainFeedDataDisplayManager()
        ddm.delegate = viewController
        viewController.dataDisplayManager = ddm
    }

}
