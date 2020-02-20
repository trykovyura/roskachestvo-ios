//
//  ResearchFeedResearchFeedViewInput.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

protocol ResearchFeedViewInput: class {

    /**
        @author trykov
        Setup initial state of the view
    */

    func setupInitialState()
    func configureWith(researches: [ResearchesDTO])
}
