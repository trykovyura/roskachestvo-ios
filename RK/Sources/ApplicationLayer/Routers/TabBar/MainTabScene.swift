//
//  MainTabScene.swift
//  RK
//
//  Created by Трыков Юрий on 05.05.2020.
//

import SwiftUI

struct MainTabScene: View {

    @State private var selectedItem = 1

    var body: some View {
        TabView(selection: $selectedItem) {
            MainFeedViewScene()
                    .tabItem {
                        R.image.mainTab.image
                        R.string.localizable.tabMain.text
                    }.tag(1)
            Text("Second Section!")
                    .padding(0.0)
                    .tabItem {
                        R.image.searchTab.image
                        R.string.localizable.tabSearch.text
                    }.tag(2)
            Text("Scan!")
                    .padding(0.0)
                    .tabItem {
                        R.image.scanTab.image
                        R.string.localizable.tabScan.text
                    }.tag(3)
            Text("History")
                    .padding(0.0)
                    .tabItem {
                        R.image.historyTab.image
                        R.string.localizable.tabHistory.text
                    }.tag(4)
            Text("About")
                    .padding(0.0)
                    .tabItem {
                        R.image.aboutTab.image
                        R.string.localizable.tabAbout.text
                    }.tag(5)
        }
                .accentColor(R.color.viridianGreen.color)
                .font(.headline)
    }
}

struct MainTabScenePreviews: PreviewProvider {
    static var previews: some View {
        MainTabScene()
    }
}
