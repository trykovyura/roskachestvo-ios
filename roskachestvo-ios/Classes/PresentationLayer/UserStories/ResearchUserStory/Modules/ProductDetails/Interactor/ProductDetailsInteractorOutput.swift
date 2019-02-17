//
//  ProductDetailsProductDetailsInteractorOutput.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import Foundation

protocol ProductDetailsInteractorOutput: class {
    func didObtainProductDetails(product: ProductPlainObject)
    func didFailObtainProductDetails()
}
