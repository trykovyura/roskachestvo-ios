//
// Created by Трыков Юрий on 10.05.2020.
//

import UIKit

class AppConfigurator {
    func configure() {
        UINavigationBar.appearance().tintColor = R.color.viridianGreen()
        UINavigationBar.appearance().titleTextAttributes =
                [NSAttributedString.Key.foregroundColor: R.color.viridianGreen()!,
                 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold)]
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: R.color.viridianGreen()!
        ]
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
    }
}
