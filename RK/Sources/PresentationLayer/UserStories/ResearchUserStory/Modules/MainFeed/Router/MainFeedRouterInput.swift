//
//  MainFeedMainFeedRouterInput.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import Foundation

protocol MainFeedRouterInput {
    func openResearchDetails(with id: String)
    func openResearchFeed(with categoryId: String)
}