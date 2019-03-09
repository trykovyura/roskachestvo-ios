//
//  ResearchFeedResearchFeedInitializer.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import UIKit

class ResearchFeedModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var researchfeedViewController: ResearchFeedViewController!

    override func awakeFromNib() {

        let configurator = ResearchFeedModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: researchfeedViewController)
    }

}
