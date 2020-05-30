//
// Created by Юрий Трыков on 17.05.2020.
//

struct AppState: Reducable {
    let selectedTab: Int
    let categories: [CategoriesDTO]
    let showingDetailScanner: Bool
}
extension Reduce {

    static let state = AppState.reduce.with { state, action in
        AppState(selectedTab: Reduce.selectedTab(state.selectedTab, action),
                categories: Reduce.categories(state.categories, action),
                showingDetailScanner: Reduce.showingDetailScanner(state.showingDetailScanner, action))
    }
    static let selectedTab = AppState.reduce.selectedTab.withRules { match in
        match.on(Actions.ToggleTabSelect.self) { _, action in
            action.selectedTab
        }
    }
    static let categories = AppState.reduce.categories.withRules { match in
        match.on(Actions.CategoryAction.self) { state, action in
            switch action {
            case Actions.CategoryAction.success(let categories):
                return categories
            default:()
                return state
            }
        }
    }
    static let showingDetailScanner = AppState.reduce.showingDetailScanner.withRules { match in
        match.on(Actions.ScannerAction.self) { _, action in
            switch action {
            case Actions.ScannerAction.toggleScannerDetails(let value):
                return value
            }
        }
    }
}
