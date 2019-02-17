//
//  ProductDetailsProductDetailsConfigurator.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import UIKit

class ProductDetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ProductDetailsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ProductDetailsViewController) {
        let router = ProductDetailsRouter(transitionHandler: viewController)
        let interactor = ProductDetailsInteractor()
        let presenter = ProductDetailsPresenter(view: viewController, interactor: interactor, router: router)

        interactor.output = presenter
        interactor.researchNetworkService = MainAssembler.sharedInstance.resolve(ResearchNetworkServiceType.self)

        viewController.output = presenter
        viewController.moduleInput = presenter
        let ddm = ProductDetailsDataDisplayManager()
        ddm.delegate = viewController
        viewController.dataDisplayManager = ddm
    }

}
