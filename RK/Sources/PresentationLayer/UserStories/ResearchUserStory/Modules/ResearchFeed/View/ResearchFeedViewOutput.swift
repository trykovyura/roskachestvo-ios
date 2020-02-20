//
//  ResearchFeedResearchFeedViewOutput.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

protocol ResearchFeedViewOutput {

    /**
        @author trykov
        Notify presenter that view is ready
    */

    func didTriggerViewReady()
    func didTriggerResearch(with id: String)
}
