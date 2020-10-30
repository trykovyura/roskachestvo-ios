//
// Created by Юрий Трыков on 30.10.2020.
//

import SwiftUI
import KingfisherSwiftUI

struct ImageCacheView: View {
    let imageURL: URL
    var body: some View {
        R.image.octocat.image
                .resizable()
                .frame(height: 95)
                .scaledToFit()
    }
}
