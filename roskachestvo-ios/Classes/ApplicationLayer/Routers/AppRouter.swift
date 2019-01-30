//
// Created by Юрий Трыков on 2019-01-30.
// Copyright (c) 2019 trykov. All rights reserved.
//

import UIKit
import ESTabBarController_swift

final class AppRouter {

    private var mainWindow: UIWindow?

    #if BETA
    private var consoleWindow: UIWindow = {
        let consoleWindow = UIWindow(frame: UIScreen.main.bounds)
        consoleWindow.alpha = 0.9
        return consoleWindow
    }()
    #endif

    init(with window: UIWindow?) {
        mainWindow = window
    }

    var rootViewController: UIViewController? {
        return mainWindow?.rootViewController
    }

    /// view controller to present on
    var current: UIViewController? {
        var vc = mainWindow?.rootViewController
        while vc?.presentedViewController != nil {
            vc = vc?.presentedViewController
        }
        return vc
    }

    func openIntroductionViewController() {
        mainWindow?.rootViewController = UIStoryboard(name: "Introduction",
                bundle: nil).instantiateInitialViewController()
        mainWindow?.makeKeyAndVisible()
    }

    func openMainViewController() {

        let tabBarController = ESTabBarController()
        tabBarController.tabBar.barTintColor = UIColor.TextColor.Gray.athensGray
        tabBarController.tabBar.isTranslucent = true
        tabBarController.tabBar.backgroundImage = UIImage(named: "Background")
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.TextColor.Gray.athens
        let v1 = UINavigationController(rootViewController: viewController)
        let v2 = UINavigationController(rootViewController: UIViewController())
        let v3 = UINavigationController(rootViewController: UIViewController())
        let v4 = UINavigationController(rootViewController: UIViewController())
        let v5 = UINavigationController(rootViewController: UIViewController())

        v1.tabBarItem = ESTabBarItem(TabBarBasicContentView(), title: "Главная", image: UIImage(named: "MainTab"), selectedImage: UIImage(named: "MainTab"))
        v2.tabBarItem = ESTabBarItem(TabBarBasicContentView(), title: "Поиск", image: UIImage(named: "SearchTab"), selectedImage: UIImage(named: "SearchTab"))
        v3.tabBarItem = ESTabBarItem(TabBarCentralContentView(), title: nil, image: UIImage(named: "ScanTabFull"), selectedImage: UIImage(named: "ScanTabFull"))
        v4.tabBarItem = ESTabBarItem(TabBarBasicContentView(), title: "История", image: UIImage(named: "HistoryTab"), selectedImage: UIImage(named: "HistoryTab"))
        v5.tabBarItem = ESTabBarItem(TabBarBasicContentView(), title: "О нас", image: UIImage(named: "AboutTab"), selectedImage: UIImage(named: "AboutTab"))

        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        mainWindow?.rootViewController = tabBarController
        mainWindow?.makeKeyAndVisible()
    }

    func openSplashViewController() {
        mainWindow?.rootViewController = UIStoryboard(name: "SplashModule",
                bundle: nil).instantiateInitialViewController()
        mainWindow?.makeKeyAndVisible()
    }

    private func openModule(name: String) -> UIViewController {
        return UIStoryboard(name: name, bundle: nil).instantiateInitialViewController()!
    }

    #if BETA
    func showConsole(_ show: Bool = true) {
        guard show else {
            consoleWindow.isHidden = true
            return
        }
        guard consoleWindow.isHidden,
              let debugController = UIStoryboard(name: "DebugScreenModule",
                      bundle: nil).instantiateInitialViewController() else { return }
        let navigationController = UINavigationController(rootViewController: debugController)
        navigationController.navigationBar.barTintColor = .clear
        consoleWindow.rootViewController = navigationController
        consoleWindow.makeKeyAndVisible()
    }
    #endif

}
