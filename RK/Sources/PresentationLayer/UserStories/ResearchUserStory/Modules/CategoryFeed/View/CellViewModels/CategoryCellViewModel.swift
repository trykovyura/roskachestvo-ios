//
// Created by Юрий Трыков on 04.07.2020.
//

import SwiftUI

struct CategoryCellViewModel: Identifiable {
    let id: Int
    let name: String
    let image: Image
    let loading: Bool
}

extension CategoryCellViewModel {
    init(vo: CategoriesVO?, loading: Bool) {
        self.id = vo?.id ?? 0
        self.name = vo?.name ?? ""
        self.image = vo?.type.image.image ?? R.image.octocat.image
        self.loading = loading
    }
}
