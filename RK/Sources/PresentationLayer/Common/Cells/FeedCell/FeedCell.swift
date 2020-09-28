//
// Created by Юрий Трыков on 26.09.2020.
//

import SwiftUI
import SkeletonUI
import struct Kingfisher.KFImage

struct FeedCellView: View {
    let viewModel: FeedCellViewModel
    let destination: AnyView
    var body: some View {
        VStack {
            ImageView(image: viewModel.image, url: viewModel.imageURL, loading: viewModel.loading)
            TextView(name: viewModel.name, loading: viewModel.loading)
            NavigationLink(destination: destination) {
                EmptyView()
            }
        }
                .background(Color.white)
                .frame(height: 135)
    }
}
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
struct ImageCacheView: View {
    let imageURL: URL
    var body: some View {
        KFImage(imageURL)
                .placeholder { R.image.octocat.image }
                .resizable()
                .frame(height: 95)
                .frame(minWidth: 0, maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
    }
}
struct ImageDataView: View {
    let image: Image
    let loading: Bool
    var body: some View {
        image
                .resizable()
                .skeleton(with: loading)
                .shape(type: .rectangle)
                .appearance(type: .gradient())
                .animation(type: .none)
                .frame(height: 95)
                .frame(minWidth: 0, maxWidth: .infinity)
    }
}
struct TextView: View {
    let name: String
    let loading: Bool

    var body: some View {
        Text(name)
                .font(.system(size: 12.0, weight: .medium))
                .skeleton(with: loading)
                .shape(type: .capsule)
                .multiline(lines: 3, scales: [1: 0.5, 2: 0.25])
                .appearance(type: .gradient())
                .animation(type: .linear())
    }
}
