//
//  ResearchFeedResearchFeedInteractorOutput.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import Foundation

protocol ResearchFeedInteractorOutput: class {
    func didObtainResearches(_ researches: [ResearchesPlainObject])
    func didFailObtainResearches()
}
