//
// Created by Юрий Трыков on 21.05.2020.
//

extension Actions {
    struct ToggleTabSelect: Action {
        let selectedTab: Int
    }
    struct ToggleCategories: Action {
        let categories: [CategoriesDTO]
    }
}
