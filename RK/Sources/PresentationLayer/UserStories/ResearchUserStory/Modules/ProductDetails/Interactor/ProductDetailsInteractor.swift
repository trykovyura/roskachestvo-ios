//
//  ProductDetailsProductDetailsInteractor.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import RxSwift

class ProductDetailsInteractor: ProductDetailsInteractorInput {

    weak var output: ProductDetailsInteractorOutput!

    var researchNetworkService: ResearchNetworkServiceType!

    let disposeBag = DisposeBag()

    func productDetails(with productId: String) {
//        researchNetworkService.product(id: productId)
//                .receive(on: DispatchQueue.main)
//                .sink(
//                        onNext: { [weak self] product in
//                            self?.output.didObtainProductDetails(product: product)
//                        }, onError: { [weak self] error in
//                    print(error)
//                    self?.output.didFailObtainProductDetails()
//                })
//                .disposed(by: disposeBag)
    }
}
