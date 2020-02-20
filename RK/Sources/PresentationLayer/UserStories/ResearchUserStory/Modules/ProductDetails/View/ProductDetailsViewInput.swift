//
//  ProductDetailsProductDetailsViewInput.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

protocol ProductDetailsViewInput: class {

    /**
        @author trykov
        Setup initial state of the view
    */

    func setupInitialState()
    func configure(with product: ProductDTO)
}
