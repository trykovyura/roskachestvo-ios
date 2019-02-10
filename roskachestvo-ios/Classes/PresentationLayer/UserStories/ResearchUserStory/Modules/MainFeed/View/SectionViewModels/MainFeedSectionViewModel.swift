//
//  MainFeedMainFeedSectionViewModel.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import IGListKit

class MainFeedSectionViewModel: NSObject {

    let viewModel: MainFeedCellViewModel
    let researches: [ListDiffable]

    init(viewModel: MainFeedCellViewModel, researches: [ListDiffable]) {
       self.viewModel = viewModel
       self.researches = researches
    }
}

extension MainFeedSectionViewModel: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return self
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }

}
