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
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: R.color.viridianGreen()!
        ]
        UINavigationBar.appearance().hideBottomHairline()
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = R.color.background()
        UITableView.appearance().tableFooterView = UIView()
    }
}
