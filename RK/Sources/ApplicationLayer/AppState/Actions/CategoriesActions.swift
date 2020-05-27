//
// Created by Юрий Трыков on 27.05.2020.
//

extension Actions {
    struct TriggerCategories: Action {
    }
    struct ToggleCategories: Action {
        let categories: [CategoriesDTO]
    }
}
