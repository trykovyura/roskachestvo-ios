//
//  ProductDetailsProductDetailsPresenter.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import Foundation
import ViperMcFlurry

class ProductDetailsPresenter: NSObject, ProductDetailsModuleInput {

    weak var view: ProductDetailsViewInput?
    var interactor: ProductDetailsInteractorInput
    var router: ProductDetailsRouterInput
    weak var moduleOutput: ProductDetailsModuleOutput?

    var productId: String = ""

    init(view: ProductDetailsViewInput, interactor: ProductDetailsInteractorInput, router: ProductDetailsRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func configure(with productId: String) {
        self.productId = productId
    }
}

extension ProductDetailsPresenter: ProductDetailsViewOutput {

    func didTriggerViewReady() {
        view?.setupInitialState()
        interactor.productDetails(with: productId)
    }

}

extension ProductDetailsPresenter: ProductDetailsInteractorOutput {
    func didObtainProductDetails(product: ProductPlainObject) {
        view?.configure(with: product)
    }

    func didFailObtainProductDetails() {

    }
}

extension ProductDetailsPresenter {

    func setModuleOutput(_ moduleOutput: RamblerViperModuleOutput!) {
        self.moduleOutput = moduleOutput as? ProductDetailsModuleOutput
    }

}
