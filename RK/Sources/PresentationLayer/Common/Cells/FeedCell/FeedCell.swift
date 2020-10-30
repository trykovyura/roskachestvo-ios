//
// Created by Юрий Трыков on 26.09.2020.
//

import SwiftUI
import SkeletonUI

struct FeedCellView: View {
    let viewModel: FeedCellViewModel
    let destination: AnyView
    var body: some View {
        HStack {
            VStack {
                ImageView(image: viewModel.image, url: viewModel.imageURL, loading: viewModel.loading)
                TextView(name: viewModel.name, loading: viewModel.loading)
                NavigationLink(destination: destination) {
                    EmptyView()
                }
            }
            Spacer()
        }
                .background(Color.white)
                .frame(height: 135)
    }
}
