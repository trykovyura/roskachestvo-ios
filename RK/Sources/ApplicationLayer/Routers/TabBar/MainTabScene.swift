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
    TabView (selection: $selectedItem) {
      // First Secection
      MainFeedViewScene()
        .tabItem {
            Image(R.image.mainTab.name)
      Text("Главная")
    }.tag(1)

      // Second Secection
        Text("Second Section!")
            .padding(0.0)
        .tabItem {
            Image(R.image.searchTab.name)
      Text("Поиск")
    }.tag(2)

   }
   .font(.headline)
  }
}

struct MainTabScenePreviews: PreviewProvider {
    static var previews: some View {
        MainTabScene()
    }
}
