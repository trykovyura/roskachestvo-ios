//
// Created by Юрий Трыков on 17.05.2020.
//

struct AppState: Reducable {
    let selectedTab: Int
    let categories: [CategoriesDTO]
}
extension Reduce {

    static let state = AppState.reduce.with { state, action in
        AppState(selectedTab: Reduce.selectedTab(state.selectedTab, action),
                categories: Reduce.categories(state.categories, action))
    }
    static let selectedTab = AppState.reduce.selectedTab.withRules { match in
        match.on(Actions.ToggleTabSelect.self) { _, action in
            action.selectedTab
        }
    }
    static let categories = AppState.reduce.categories.withRules { match in
        match.on(Actions.ToggleCategories.self) { _, action in
            action.categories
        }
    }
}
