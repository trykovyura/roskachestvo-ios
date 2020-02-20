//
//  ResearchFeedResearchFeedModuleInput.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//
import ViperMcFlurry

protocol ResearchFeedModuleInput: class, RamblerViperModuleInput {
    // Конфигурирование модуля
    // @param: categoryId - категория исследования, если не указано, то все исследования выводятся
    func configure(with categoryId: String?)
}
