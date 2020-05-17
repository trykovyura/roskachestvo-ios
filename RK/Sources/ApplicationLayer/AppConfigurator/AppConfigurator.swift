//
// Created by Трыков Юрий on 10.05.2020.
//

import UIKit

class AppConfigurator {
    func configure() {
        UINavigationBar.appearance().tintColor = R.color.viridianGreen()
        UINavigationBar.appearance().titleTextAttributes =
                [NSAttributedString.Key.foregroundColor: R.color.viridianGreen()!,
                 NSAttributedString.Key.font: R.font.backpackBold(size: 15)!]
        UINavigationBar.appearance().hideBottomHairline()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
    }
}
