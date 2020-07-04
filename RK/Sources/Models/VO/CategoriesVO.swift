//
// Created by Юрий Трыков on 04.07.2020.
//

import Foundation

struct CategoriesVO: Equatable, Identifiable {
    let id: Int
    let type: CategoryType
    let name: String
}
extension CategoriesVO {
    init?(dto: CategoriesDTO) {
        guard let id = dto.id else {
            return nil
        }
        self.id = id
        self.type = CategoryType(rawValue: id)
        self.name = dto.name ?? ""
    }
}
