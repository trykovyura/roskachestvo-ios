//
//  ResearchDetailsResearchDetailsInitializer.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import UIKit

class ResearchDetailsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var researchdetailsViewController: ResearchDetailsViewController!

    override func awakeFromNib() {

        let configurator = ResearchDetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: researchdetailsViewController)
    }

}
