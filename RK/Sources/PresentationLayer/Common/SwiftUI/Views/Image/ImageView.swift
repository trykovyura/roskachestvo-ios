//
// Created by Юрий Трыков on 30.10.2020.
//

import SwiftUI

struct ImageView: View {
    let image: Image?
    let url: URL?
    let loading: Bool
    var body: some View {
        if let image = image {
            return AnyView(ImageDataView(image: image, loading: loading))
        } else if let url = url {
            return AnyView(ImageCacheView(imageURL: url))
        } else {
            return AnyView(R.image.octocat.image)
        }
    }
}
