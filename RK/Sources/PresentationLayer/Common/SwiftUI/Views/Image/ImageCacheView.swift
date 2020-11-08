//
// Created by Юрий Трыков on 30.10.2020.
//

import SwiftUI
import URLImage

struct ImageCacheView: View {
    let imageURL: URL
    var body: some View {
        URLImage(url: imageURL) { image in
            image.resizable()
                    .frame(height: 95)
                    .aspectRatio(contentMode: .fit)
        }

    }
}
