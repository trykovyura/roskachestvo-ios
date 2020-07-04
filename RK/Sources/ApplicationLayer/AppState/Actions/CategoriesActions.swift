//
// Created by Юрий Трыков on 27.05.2020.
//

extension Actions {
    enum CategoryAction: Action {
        case start
        case error(Error)
        case success([CategoriesVO])
    }
}
