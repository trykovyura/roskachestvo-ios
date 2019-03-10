//
//  ResearchFeedResearchFeedSectionViewModel.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

class ResearchFeedSectionViewModel: NSObject {

    let viewModel: ResearchCellViewModel

    init(viewModel: ResearchCellViewModel) {
       self.viewModel = viewModel
    }
}

extension ResearchFeedSectionViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return self
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }

}
