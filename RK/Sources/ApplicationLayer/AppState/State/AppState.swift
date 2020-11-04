//
// Created by Юрий Трыков on 17.05.2020.
//

struct AppState: Reducable {
    let selectedTab: Int
    let categories: [CategoriesVO]
    let showingDetailScanner: Bool
    let research: ResearchVO?
    let product: ProductVO?
    let productId: Int?
}
extension Reduce {

    static let state = AppState.reduce.with { state, action in
        AppState(selectedTab: Reduce.selectedTab(state.selectedTab, action),
                categories: Reduce.categories(state.categories, action),
                showingDetailScanner: Reduce.showingDetailScanner(state.showingDetailScanner, action),
                research: Reduce.research(state.research, action),
                product: Reduce.product(state.product, action),
                productId: Reduce.productId(state.productId, action))
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
            case Actions.CategoryAction.error(let error):
                return state
            default:()
                return state
            }
        }
    }
    static let research = AppState.reduce.research.withRules { match in
        match.on(Actions.ResearchFeedAction.self) { state, action in
            switch action {
            case Actions.ResearchFeedAction.success(let research):
                return research
            case Actions.ResearchFeedAction.error(let error):
                return state
            default:()
                return state
            }
        }
    }
    static let product = AppState.reduce.product.withRules { match in
        match.on(Actions.ProductDetailsAction.self) { state, action in
            switch action {
            case Actions.ProductDetailsAction.success(let product):
                return product
            case Actions.ProductDetailsAction.error(let error):
                return state
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

    static let productId = AppState.reduce.productId.withRules { match in
        match.on(Actions.BarCodeAction.self) { state, action in
            switch action {
            case Actions.BarCodeAction.success(let productId):
                return productId
            default: return state
            }
        }
    }
}
