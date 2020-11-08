//
// Created by Юрий Трыков on 04.07.2020.
//

import SwiftUI

struct FeedCellViewModel: Identifiable {
    let id: Int
    let name: String
    let image: Image?
    let imageURL: URL?
    let loading: Bool
}

extension FeedCellViewModel {
    init(vo: CategoriesVO?, loading: Bool) {
        self.id = vo?.id ?? 0
        self.name = vo?.name.stringByDecodingHTMLEntities ?? ""
        self.image = vo?.type.image.image ?? R.image.octocat.image
        self.imageURL = nil
        self.loading = loading
    }

    init(vo: ResearchesVO?, loading: Bool) {
        self.id = vo?.id ?? 0
        self.name = vo?.name.stringByDecodingHTMLEntities ?? ""
        self.imageURL = vo?.image?.src?.imageURL()
        self.image = nil
        self.loading = loading
    }

    init(vo: ProductsVO?, loading: Bool) {
        self.id = vo?.id ?? 0
        self.name = vo?.name.stringByDecodingHTMLEntities ?? ""
        self.imageURL = vo?.image?.src?.imageURL()
        self.image = nil
        self.loading = loading
    }
}
