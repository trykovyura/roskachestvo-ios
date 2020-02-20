//
//  ProductDetailsProductDetailsInitializer.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import UIKit

class ProductDetailsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var productdetailsViewController: ProductDetailsViewController!

    override func awakeFromNib() {

        let configurator = ProductDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: productdetailsViewController)
    }

}
