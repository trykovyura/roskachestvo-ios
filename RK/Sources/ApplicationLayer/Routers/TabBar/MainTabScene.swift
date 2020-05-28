//
//  MainTabScene.swift
//  RK
//
//  Created by Трыков Юрий on 05.05.2020.
//

import SwiftUI

struct MainTabScene: ConnectedView {

    struct Props {
        let selectedItem: Binding<Int>
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let selectedItem = Binding<Int>(get: { state.selectedTab },
                set: { dispatch(Actions.ToggleTabSelect(selectedTab: $0)) })
        return Props(selectedItem: selectedItem)
    }

    static func body(props: Props) -> some View {
        TabView(selection: props.selectedItem) {
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
            ScannerViewScene()
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
