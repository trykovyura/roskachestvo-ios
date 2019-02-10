//
//  MainFeedMainFeedInteractorOutput.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import Foundation

protocol MainFeedInteractorOutput: class {

    func didObtainCategoriesWithResearches(_ response: [CategoriesPlainObject])
    func didFailObtainCategoriesWithResearches()
}
