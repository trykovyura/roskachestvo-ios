//
//  ResearchDetailsResearchDetailsConfigurator.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import UIKit

class ResearchDetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ResearchDetailsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ResearchDetailsViewController) {
        let router = ResearchDetailsRouter(transitionHandler: viewController)
        let interactor = ResearchDetailsInteractor()
        let presenter = ResearchDetailsPresenter(view: viewController, interactor: interactor, router: router)

        interactor.output = presenter

        viewController.output = presenter
        viewController.moduleInput = presenter
        let ddm = ResearchDetailsDataDisplayManager()
        ddm.delegate = viewController
        viewController.dataDisplayManager = ddm
    }

}
