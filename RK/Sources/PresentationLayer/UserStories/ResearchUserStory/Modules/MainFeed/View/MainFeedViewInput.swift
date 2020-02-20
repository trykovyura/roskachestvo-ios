//
//  MainFeedMainFeedViewInput.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

protocol MainFeedViewInput: class {

    /**
        @author trykov
        Setup initial state of the view
    */

    func setupInitialState()
    func configureWith(categories: [CategoriesDTO])
}
