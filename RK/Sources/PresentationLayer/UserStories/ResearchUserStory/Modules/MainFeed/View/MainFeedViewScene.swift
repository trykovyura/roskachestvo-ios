//
//  MainFeedViewScene.swift
//  RK
//
//  Created by Трыков Юрий on 10.05.2020.
//

import SwiftUI

struct MainFeedViewScene: UIViewControllerRepresentable {

    typealias UIViewControllerType = MainFeedViewController

    func makeUIViewController(context: Context) -> MainFeedViewController {
        R.storyboard.mainFeed.instantiateInitialViewController()!
    }

    func updateUIViewController(_ uiViewController: MainFeedViewController, context: Context) {
    }
}
