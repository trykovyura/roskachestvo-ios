//
// Created by Юрий Трыков on 2019-01-30.
// Copyright (c) 2019 trykov. All rights reserved.
//

import UIKit
import ESTabBarController_swift
import SwiftUI

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
