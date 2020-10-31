//
// Created by Юрий Трыков on 26.09.2020.
//

import SwiftUI
import SkeletonUI

struct FeedCellView: View {
    let viewModel: FeedCellViewModel
    var body: some View {
        HStack {
            VStack {
                ImageView(image: viewModel.image, url: viewModel.imageURL, loading: viewModel.loading)
                    .frame(maxWidth: .infinity)
                    .frame(height: 95)
                TextView(name: viewModel.name, loading: viewModel.loading)
                        .frame(maxWidth: .infinity)
                        .padding(10)
            }
        }
                .background(Color.white)
                .frame(height: 135)
    }
}
