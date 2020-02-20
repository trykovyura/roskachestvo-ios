//
//  ResearchDetailsResearchDetailsSectionViewModel.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

class ResearchDetailsSectionViewModel: NSObject {

    let viewModel: ResearchDetailsCellViewModel
    let products: [ListDiffable]

    init(viewModel: ResearchDetailsCellViewModel, products: [ListDiffable]) {
       self.viewModel = viewModel
       self.products = products
    }
}

extension ResearchDetailsSectionViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return self
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }

}
