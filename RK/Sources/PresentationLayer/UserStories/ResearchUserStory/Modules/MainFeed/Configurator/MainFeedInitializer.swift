//
//  MainFeedMainFeedInitializer.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import UIKit

class MainFeedModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var mainfeedViewController: MainFeedViewController!

    override func awakeFromNib() {

        let configurator = MainFeedModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: mainfeedViewController)
    }

}
