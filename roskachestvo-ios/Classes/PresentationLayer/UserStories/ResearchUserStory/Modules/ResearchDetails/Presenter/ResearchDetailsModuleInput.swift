//
//  ResearchDetailsResearchDetailsModuleInput.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//
import ViperMcFlurry

protocol ResearchDetailsModuleInput: class, RamblerViperModuleInput {
    func configure(with researchId: String)
}
